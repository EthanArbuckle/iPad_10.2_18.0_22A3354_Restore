@implementation PHMemoryChangeRequest

- (PHObjectPlaceholder)placeholderForCreatedMemory
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHObjectPlaceholder *)v4;
}

- (id)initForNewObject
{
  PHMemoryChangeRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v5;
  PHRelationshipChangeRequestHelper *keyAssetHelper;
  PHRelationshipChangeRequestHelper *v7;
  PHRelationshipChangeRequestHelper *representativeAssetsHelper;
  PHRelationshipChangeRequestHelper *v9;
  PHRelationshipChangeRequestHelper *curatedAssetsHelper;
  PHRelationshipChangeRequestHelper *v11;
  PHRelationshipChangeRequestHelper *extendedCuratedAssetsHelper;
  PHRelationshipChangeRequestHelper *v13;
  PHRelationshipChangeRequestHelper *movieCuratedAssetsHelper;
  PHRelationshipChangeRequestHelper *v15;
  PHRelationshipChangeRequestHelper *userCuratedAssetsHelper;
  PHRelationshipChangeRequestHelper *v17;
  PHRelationshipChangeRequestHelper *customUserAssetsHelper;
  PHRelationshipChangeRequestHelper *v19;
  PHRelationshipChangeRequestHelper *userRemovedAssetsHelper;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)PHMemoryChangeRequest;
  v2 = -[PHChangeRequest init](&v22, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

    v5 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("keyAsset"), v2->super._helper);
    keyAssetHelper = v2->_keyAssetHelper;
    v2->_keyAssetHelper = v5;

    v7 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("representativeAssets"), v2->super._helper);
    representativeAssetsHelper = v2->_representativeAssetsHelper;
    v2->_representativeAssetsHelper = v7;

    v9 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("curatedAssets"), v2->super._helper);
    curatedAssetsHelper = v2->_curatedAssetsHelper;
    v2->_curatedAssetsHelper = v9;

    v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("extendedCuratedAssets"), v2->super._helper);
    extendedCuratedAssetsHelper = v2->_extendedCuratedAssetsHelper;
    v2->_extendedCuratedAssetsHelper = v11;

    v13 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("movieCuratedAssets"), v2->super._helper);
    movieCuratedAssetsHelper = v2->_movieCuratedAssetsHelper;
    v2->_movieCuratedAssetsHelper = v13;

    v15 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("userCuratedAssets"), v2->super._helper);
    userCuratedAssetsHelper = v2->_userCuratedAssetsHelper;
    v2->_userCuratedAssetsHelper = v15;

    v17 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("customUserAssets"), v2->super._helper);
    customUserAssetsHelper = v2->_customUserAssetsHelper;
    v2->_customUserAssetsHelper = v17;

    v19 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("userRemovedAssets"), v2->super._helper);
    userRemovedAssetsHelper = v2->_userRemovedAssetsHelper;
    v2->_userRemovedAssetsHelper = v19;

  }
  return v2;
}

- (PHMemoryChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHMemoryChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v11;
  PHRelationshipChangeRequestHelper *keyAssetHelper;
  PHRelationshipChangeRequestHelper *v13;
  PHRelationshipChangeRequestHelper *movieCuratedAssetsHelper;
  PHRelationshipChangeRequestHelper *v15;
  PHRelationshipChangeRequestHelper *userCuratedAssetsHelper;
  PHRelationshipChangeRequestHelper *v17;
  PHRelationshipChangeRequestHelper *customUserAssetsHelper;
  PHRelationshipChangeRequestHelper *v19;
  PHRelationshipChangeRequestHelper *userRemovedAssetsHelper;
  objc_super v22;

  v6 = a3;
  v7 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PHMemoryChangeRequest;
  v8 = -[PHChangeRequest init](&v22, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

    v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("keyAsset"), v8->super._helper);
    keyAssetHelper = v8->_keyAssetHelper;
    v8->_keyAssetHelper = v11;

    v13 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("movieCuratedAssets"), v8->super._helper);
    movieCuratedAssetsHelper = v8->_movieCuratedAssetsHelper;
    v8->_movieCuratedAssetsHelper = v13;

    v15 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("userCuratedAssets"), v8->super._helper);
    userCuratedAssetsHelper = v8->_userCuratedAssetsHelper;
    v8->_userCuratedAssetsHelper = v15;

    v17 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("customUserAssets"), v8->super._helper);
    customUserAssetsHelper = v8->_customUserAssetsHelper;
    v8->_customUserAssetsHelper = v17;

    v19 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("userRemovedAssets"), v8->super._helper);
    userRemovedAssetsHelper = v8->_userRemovedAssetsHelper;
    v8->_userRemovedAssetsHelper = v19;

  }
  return v8;
}

- (PHMemoryChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHMemoryChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v14;
  PHRelationshipChangeRequestHelper *representativeAssetsHelper;
  PHRelationshipChangeRequestHelper *v16;
  PHRelationshipChangeRequestHelper *curatedAssetsHelper;
  PHRelationshipChangeRequestHelper *v18;
  PHRelationshipChangeRequestHelper *extendedCuratedAssetsHelper;
  PHRelationshipChangeRequestHelper *v20;
  PHRelationshipChangeRequestHelper *keyAssetHelper;
  PHRelationshipChangeRequestHelper *v22;
  PHRelationshipChangeRequestHelper *movieCuratedAssetsHelper;
  PHRelationshipChangeRequestHelper *v24;
  PHRelationshipChangeRequestHelper *userCuratedAssetsHelper;
  PHRelationshipChangeRequestHelper *v26;
  PHRelationshipChangeRequestHelper *customUserAssetsHelper;
  PHRelationshipChangeRequestHelper *v28;
  PHRelationshipChangeRequestHelper *userRemovedAssetsHelper;
  PHMemoryChangeRequest *v30;
  void (**v31)(_QWORD);
  _BOOL4 v32;
  int v33;
  void *v34;
  uint64_t v35;
  id v36;
  PHUserFeedback *userFeedback;
  NSObject *v38;
  _BOOL4 v39;
  _BOOL4 v40;
  _BOOL4 v41;
  int64_t int64;
  uint64_t v43;
  NSNumber *customMaximumNumberOfAssetsForUnitTesting;
  id v46;
  _QWORD aBlock[4];
  PHMemoryChangeRequest *v48;
  id v49;
  objc_super v50;
  uint8_t buf[4];
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v50.receiver = self;
  v50.super_class = (Class)PHMemoryChangeRequest;
  v11 = -[PHChangeRequest init](&v50, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      v14 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("representativeAssets"), v8, v11->super._helper);
      representativeAssetsHelper = v11->_representativeAssetsHelper;
      v11->_representativeAssetsHelper = v14;

      v16 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("curatedAssets"), v8, v11->super._helper);
      curatedAssetsHelper = v11->_curatedAssetsHelper;
      v11->_curatedAssetsHelper = v16;

      v18 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("extendedCuratedAssets"), v8, v11->super._helper);
      extendedCuratedAssetsHelper = v11->_extendedCuratedAssetsHelper;
      v11->_extendedCuratedAssetsHelper = v18;

      v20 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("keyAsset"), v8, v11->super._helper);
      keyAssetHelper = v11->_keyAssetHelper;
      v11->_keyAssetHelper = v20;

      v22 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("movieCuratedAssets"), v8, v11->super._helper);
      movieCuratedAssetsHelper = v11->_movieCuratedAssetsHelper;
      v11->_movieCuratedAssetsHelper = v22;

      v24 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("userCuratedAssets"), v8, v11->super._helper);
      userCuratedAssetsHelper = v11->_userCuratedAssetsHelper;
      v11->_userCuratedAssetsHelper = v24;

      v26 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("customUserAssets"), v8, v11->super._helper);
      customUserAssetsHelper = v11->_customUserAssetsHelper;
      v11->_customUserAssetsHelper = v26;

      v11->_clientEntitledToMemoryMutation = objc_msgSend(v10, "photoKitEntitledFor:", *MEMORY[0x1E0D749E0]);
      v28 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("userRemovedAssets"), v8, v11->super._helper);
      userRemovedAssetsHelper = v11->_userRemovedAssetsHelper;
      v11->_userRemovedAssetsHelper = v28;

      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __69__PHMemoryChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke;
      aBlock[3] = &unk_1E35DF9E8;
      v30 = v11;
      v48 = v30;
      v49 = v9;
      v31 = (void (**)(_QWORD))_Block_copy(aBlock);
      v30->_incrementPlayCount = xpc_dictionary_get_BOOL(v8, "incrementPlayCount");
      v30->_incrementShareCount = xpc_dictionary_get_BOOL(v8, "incrementShareCount");
      v32 = xpc_dictionary_get_BOOL(v8, "incrementViewCount");
      v30->_incrementViewCount = v32;
      if (v30->_incrementPlayCount || (v30->_incrementShareCount ? (v33 = 1) : (v33 = v32), v33 == 1))
        v31[2](v31);
      PLDataFromXPCDictionary();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      if (v34)
      {
        v46 = 0;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v34, &v46);
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v46;
        userFeedback = v30->_userFeedback;
        v30->_userFeedback = (PHUserFeedback *)v35;

        if (v30->_userFeedback)
        {
          v31[2](v31);
        }
        else
        {
          PLPhotoKitGetLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v52 = v36;
            _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_DEFAULT, "Failed to decode userFeedback object: %@", buf, 0xCu);
          }

        }
      }
      v39 = xpc_dictionary_get_BOOL(v8, "userFeedbackDataUnsetKey");
      v30->_didUnsetUserFeedback = v39;
      if (v39)
        v31[2](v31);
      v40 = xpc_dictionary_get_BOOL(v8, "userCreatedDidSetKey");
      v30->_didSetUserCreated = v40;
      if (v40)
      {
        v30->_userCreated = xpc_dictionary_get_BOOL(v8, "userCreatedKey");
        v31[2](v31);
      }
      v41 = xpc_dictionary_get_BOOL(v8, "userEditedDidSetKey");
      v30->_didSetUserEdited = v41;
      if (v41)
      {
        v30->_userEdited = xpc_dictionary_get_BOOL(v8, "userEditedKey");
        v31[2](v31);
      }
      int64 = xpc_dictionary_get_int64(v8, "customMaximumNumberOfAssetsForUnitTesting");
      if (int64 >= 1)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", int64);
        v43 = objc_claimAutoreleasedReturnValue();
        customMaximumNumberOfAssetsForUnitTesting = v30->_customMaximumNumberOfAssetsForUnitTesting;
        v30->_customMaximumNumberOfAssetsForUnitTesting = (NSNumber *)v43;

      }
    }
  }

  return v11;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PHUserFeedback *userFeedback;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeToXPCDict:", v4);

  -[PHMemoryChangeRequest representativeAssetsHelper](self, "representativeAssetsHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeToXPCDict:", v4);

  -[PHMemoryChangeRequest curatedAssetsHelper](self, "curatedAssetsHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeToXPCDict:", v4);

  -[PHMemoryChangeRequest extendedCuratedAssetsHelper](self, "extendedCuratedAssetsHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeToXPCDict:", v4);

  -[PHMemoryChangeRequest keyAssetHelper](self, "keyAssetHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeToXPCDict:", v4);

  -[PHMemoryChangeRequest movieCuratedAssetsHelper](self, "movieCuratedAssetsHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeToXPCDict:", v4);

  -[PHMemoryChangeRequest userCuratedAssetsHelper](self, "userCuratedAssetsHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeToXPCDict:", v4);

  -[PHMemoryChangeRequest customUserAssetsHelper](self, "customUserAssetsHelper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "encodeToXPCDict:", v4);

  -[PHMemoryChangeRequest userRemovedAssetsHelper](self, "userRemovedAssetsHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "encodeToXPCDict:", v4);

  if (self->_incrementPlayCount)
    xpc_dictionary_set_BOOL(v4, "incrementPlayCount", 1);
  if (self->_incrementShareCount)
    xpc_dictionary_set_BOOL(v4, "incrementShareCount", 1);
  if (self->_incrementViewCount)
    xpc_dictionary_set_BOOL(v4, "incrementViewCount", 1);
  userFeedback = self->_userFeedback;
  if (userFeedback)
  {
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", userFeedback, 1, &v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;
    if (v15)
    {
      PLXPCDictionarySetData();
    }
    else
    {
      PLPhotoKitGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v16;
        _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEFAULT, "Failed to encode userFeedback object: %@", buf, 0xCu);
      }

    }
  }
  xpc_dictionary_set_BOOL(v4, "userFeedbackDataUnsetKey", self->_didUnsetUserFeedback);
  xpc_dictionary_set_BOOL(v4, "userCreatedKey", self->_userCreated);
  xpc_dictionary_set_BOOL(v4, "userCreatedDidSetKey", self->_userCreated);
  xpc_dictionary_set_BOOL(v4, "userEditedKey", self->_userEdited);
  xpc_dictionary_set_BOOL(v4, "userEditedDidSetKey", self->_userEdited);
  xpc_dictionary_set_int64(v4, "customMaximumNumberOfAssetsForUnitTesting", -[NSNumber integerValue](self->_customMaximumNumberOfAssetsForUnitTesting, "integerValue"));

}

- (NSString)managedEntityName
{
  return (NSString *)CFSTR("Memory");
}

- (BOOL)isRejected
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("rejected"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setRejected:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("rejected"));

}

- (BOOL)isFavorite
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("favorite"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setFavorite:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("favorite"));

}

- (unsigned)pendingState
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("pendingState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setPendingState:(unsigned __int16)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("pendingState"));

}

- (unsigned)creationType
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("creationType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setCreationType:(unsigned __int16)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("creationType"));

}

- (unint64_t)category
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
  objc_msgSend(v4, "objectForKey:", CFSTR("category"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setCategory:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("category"));

}

- (unint64_t)subcategory
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
  objc_msgSend(v4, "objectForKey:", CFSTR("subcategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setSubcategory:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("subcategory"));

}

- (double)score
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
  objc_msgSend(v4, "objectForKey:", CFSTR("score"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

- (void)setScore:(double)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("score"));

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

- (NSString)subtitle
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

- (void)setSubtitle:(id)a3
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

- (NSString)graphMemoryIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("graphMemoryIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setGraphMemoryIdentifier:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("graphMemoryIdentifier"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("graphMemoryIdentifier"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("graphMemoryIdentifier"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("graphMemoryIdentifier"));
  }

}

- (int64_t)storyColorGradeKind
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
  objc_msgSend(v4, "objectForKey:", CFSTR("storyColorGradeKind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setStoryColorGradeKind:(int64_t)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("storyColorGradeKind"));

}

- (int64_t)storySerializedTitleCategory
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
  objc_msgSend(v4, "objectForKey:", CFSTR("storySerializedTitleCategory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setStorySerializedTitleCategory:(int64_t)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("storySerializedTitleCategory"));

}

- (NSData)movieData
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("movieData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v5;
}

- (void)setMovieData:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("movieData"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("movieData"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("movieData"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("movieData"));
  }

}

- (NSData)photosGraphData
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("photosGraphData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v5;
}

- (void)setPhotosGraphData:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("photosGraphData"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("photosGraphData"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("photosGraphData"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("photosGraphData"));
  }

}

- (int64_t)photosGraphVersion
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
  objc_msgSend(v4, "objectForKey:", CFSTR("photosGraphVersion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "longLongValue");
  return v6;
}

- (void)setPhotosGraphVersion:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("photosGraphVersion"));

}

- (NSDate)lastViewedDate
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("lastViewedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setLastViewedDate:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("lastViewedDate"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("lastViewedDate"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("lastViewedDate"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("lastViewedDate"));
  }

}

- (NSDate)lastMoviePlayedDate
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("lastMoviePlayedDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v5;
}

- (void)setLastMoviePlayedDate:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("lastMoviePlayedDate"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("lastMoviePlayedDate"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("lastMoviePlayedDate"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("lastMoviePlayedDate"));
  }

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

- (unint64_t)notificationState
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
  objc_msgSend(v4, "objectForKey:", CFSTR("notificationState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setNotificationState:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mutations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("notificationState"));

}

- (int64_t)featuredState
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
  objc_msgSend(v4, "objectForKey:", CFSTR("featuredState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setFeaturedState:(int64_t)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("featuredState"));

}

- (BOOL)isUserCreated
{
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  return self->_userCreated;
}

- (void)setUserCreated:(BOOL)a3
{
  void *v5;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  self->_userCreated = a3;
  self->_didSetUserCreated = 1;
}

- (BOOL)isUserEdited
{
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  return self->_userCreated;
}

- (void)setUserEdited:(BOOL)a3
{
  void *v5;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  self->_userEdited = a3;
  self->_didSetUserEdited = 1;
}

- (NSString)storyTitleCategory
{
  -[PHMemoryChangeRequest storySerializedTitleCategory](self, "storySerializedTitleCategory");
  return (NSString *)PFStoryValidatedTitleCategory();
}

- (void)setStoryTitleCategory:(id)a3
{
  -[PHMemoryChangeRequest setStorySerializedTitleCategory:](self, "setStorySerializedTitleCategory:", PFStoryTitleCategoryGetSerializedTitleCategory());
}

- (void)_prepareAssetIDsIfNeeded
{
  void *v3;
  void *v4;
  PHRelationshipChangeRequestHelper *representativeAssetsHelper;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PHRelationshipChangeRequestHelper *curatedAssetsHelper;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PHRelationshipChangeRequestHelper *extendedCuratedAssetsHelper;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  PHRelationshipChangeRequestHelper *keyAssetHelper;
  void *v21;
  id v22;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_representativeAssetsHelper, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_representativeAssetsHelper, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_representativeAssetsHelper, "mutableObjectIDsAndUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    representativeAssetsHelper = self->_representativeAssetsHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](representativeAssetsHelper, "originalObjectIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](representativeAssetsHelper, "setMutableObjectIDsAndUUIDs:", v7);

  }
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_curatedAssetsHelper, "originalObjectIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_curatedAssetsHelper, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_curatedAssetsHelper, "mutableObjectIDsAndUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    curatedAssetsHelper = self->_curatedAssetsHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](curatedAssetsHelper, "originalObjectIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](curatedAssetsHelper, "setMutableObjectIDsAndUUIDs:", v12);

  }
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_extendedCuratedAssetsHelper, "originalObjectIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_extendedCuratedAssetsHelper, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_extendedCuratedAssetsHelper, "mutableObjectIDsAndUUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    extendedCuratedAssetsHelper = self->_extendedCuratedAssetsHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](extendedCuratedAssetsHelper, "originalObjectIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v16, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](extendedCuratedAssetsHelper, "setMutableObjectIDsAndUUIDs:", v17);

  }
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_keyAssetHelper, "originalObjectIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_keyAssetHelper, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_keyAssetHelper, "mutableObjectIDsAndUUIDs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    keyAssetHelper = self->_keyAssetHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](keyAssetHelper, "originalObjectIDs");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v22, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](keyAssetHelper, "setMutableObjectIDsAndUUIDs:", v21);

  }
}

- (id)_mutableRepresentativeAssetObjectIDsAndUUIDs
{
  -[PHMemoryChangeRequest _prepareAssetIDsIfNeeded](self, "_prepareAssetIDsIfNeeded");
  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_representativeAssetsHelper, "mutableObjectIDsAndUUIDs");
}

- (id)_mutableCuratedAssetObjectIDsAndUUIDs
{
  -[PHMemoryChangeRequest _prepareAssetIDsIfNeeded](self, "_prepareAssetIDsIfNeeded");
  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_curatedAssetsHelper, "mutableObjectIDsAndUUIDs");
}

- (id)_mutableExtendedCuratedAssetObjectIDsAndUUIDs
{
  -[PHMemoryChangeRequest _prepareAssetIDsIfNeeded](self, "_prepareAssetIDsIfNeeded");
  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_extendedCuratedAssetsHelper, "mutableObjectIDsAndUUIDs");
}

- (id)_mutableKeyAssetObjectIDsAndUUIDs
{
  -[PHMemoryChangeRequest _prepareAssetIDsIfNeeded](self, "_prepareAssetIDsIfNeeded");
  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_keyAssetHelper, "mutableObjectIDsAndUUIDs");
}

- (void)setRepresentativeAssets:(id)a3 curatedAssets:(id)a4 extendedCuratedAssets:(id)a5 keyAsset:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v39 = a5;
  v12 = a6;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v50 != v16)
          objc_enumerationMutation(v10);
        v18 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        if (!v15)
        {
          -[PHChangeRequest didMutate](self, "didMutate");
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
        }
        PLObjectIDOrUUIDFromPHObject(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v19);

      }
      v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    }
    while (v14);
    if (v15)
    {
      -[PHMemoryChangeRequest _mutableRepresentativeAssetObjectIDsAndUUIDs](self, "_mutableRepresentativeAssetObjectIDsAndUUIDs");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObjectsFromArray:", v15);

    }
  }
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v21 = v11;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  v23 = v21;
  if (!v22)
    goto LABEL_23;
  v24 = v22;
  v23 = 0;
  v25 = *(_QWORD *)v46;
  do
  {
    for (j = 0; j != v24; ++j)
    {
      if (*(_QWORD *)v46 != v25)
        objc_enumerationMutation(v21);
      v27 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
      if (!v23)
      {
        -[PHChangeRequest didMutate](self, "didMutate");
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      PLObjectIDOrUUIDFromPHObject(v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v28);

    }
    v24 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
  }
  while (v24);

  if (v23)
  {
    -[PHMemoryChangeRequest _mutableCuratedAssetObjectIDsAndUUIDs](self, "_mutableCuratedAssetObjectIDsAndUUIDs");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObjectsFromArray:", v23);

LABEL_23:
  }
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v30 = v39;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  v32 = v30;
  if (!v31)
  {
LABEL_35:

    goto LABEL_36;
  }
  v33 = v31;
  v40 = v12;
  v32 = 0;
  v34 = *(_QWORD *)v42;
  do
  {
    for (k = 0; k != v33; ++k)
    {
      if (*(_QWORD *)v42 != v34)
        objc_enumerationMutation(v30);
      v36 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * k);
      if (!v32)
      {
        -[PHChangeRequest didMutate](self, "didMutate");
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
      }
      PLObjectIDOrUUIDFromPHObject(v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addObject:", v37);

    }
    v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
  }
  while (v33);

  v12 = v40;
  if (v32)
  {
    -[PHMemoryChangeRequest _mutableExtendedCuratedAssetObjectIDsAndUUIDs](self, "_mutableExtendedCuratedAssetObjectIDsAndUUIDs");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObjectsFromArray:", v32);

    goto LABEL_35;
  }
LABEL_36:
  -[PHMemoryChangeRequest setKeyAsset:](self, "setKeyAsset:", v12);

}

- (void)setKeyAsset:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PLObjectIDOrUUIDFromPHObject(v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    if (v4)
    {
      -[PHMemoryChangeRequest _mutableKeyAssetObjectIDsAndUUIDs](self, "_mutableKeyAssetObjectIDsAndUUIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", v4);

    }
  }

}

- (void)setRepresentativeAssetUUIDs:(id)a3 curatedAssetUUIDs:(id)a4 extendedCuratedAssetUUIDs:(id)a5 keyAssetUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v16, "count"))
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHMemoryChangeRequest _mutableRepresentativeAssetObjectIDsAndUUIDs](self, "_mutableRepresentativeAssetObjectIDsAndUUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v16);

  }
  if (objc_msgSend(v10, "count"))
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHMemoryChangeRequest _mutableCuratedAssetObjectIDsAndUUIDs](self, "_mutableCuratedAssetObjectIDsAndUUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v10);

  }
  if (objc_msgSend(v11, "count"))
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHMemoryChangeRequest _mutableExtendedCuratedAssetObjectIDsAndUUIDs](self, "_mutableExtendedCuratedAssetObjectIDsAndUUIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObjectsFromArray:", v11);

  }
  -[PHMemoryChangeRequest setKeyAssetUUID:](self, "setKeyAssetUUID:", v12);

}

- (void)setKeyAssetUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHMemoryChangeRequest _mutableKeyAssetObjectIDsAndUUIDs](self, "_mutableKeyAssetObjectIDsAndUUIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "addObjectsFromArray:", v6);
  }
}

- (void)setMovieCuratedAssets:(id)a3
{
  id v4;
  void *v5;
  PHMemory *backingMemory;
  void *v7;
  PHRelationshipChangeRequestHelper *movieCuratedAssetsHelper;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  PHRelationshipChangeRequestHelper *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_movieCuratedAssetsHelper, "originalObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    backingMemory = self->_backingMemory;
    if (!backingMemory)
      goto LABEL_5;
    +[PHQuery queryForMovieCuratedAssetsInMemory:options:](PHQuery, "queryForMovieCuratedAssetsInMemory:options:", backingMemory, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "executeQuery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    movieCuratedAssetsHelper = self->_movieCuratedAssetsHelper;
    objc_msgSend(v7, "fetchedObjectIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](movieCuratedAssetsHelper, "setOriginalObjectIDs:", v9);

  }
LABEL_5:
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (!v13)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array", (_QWORD)v20);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }
        PLObjectIDOrUUIDFromPHObject(v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  -[PHChangeRequest didMutate](self, "didMutate");
  v18 = self->_movieCuratedAssetsHelper;
  if (v13)
  {
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](v18, "setMutableObjectIDsAndUUIDs:", v13);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](v18, "setMutableObjectIDsAndUUIDs:", v19);

  }
}

- (void)setUserCuratedAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PHRelationshipChangeRequestHelper *userCuratedAssetsHelper;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  PHRelationshipChangeRequestHelper *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_userCuratedAssetsHelper, "originalObjectIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (!self->_backingMemory)
      goto LABEL_5;
    +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "setIncludeGuestAssets:", 1);
    +[PHQuery queryForUserCuratedAssetsInMemory:options:](PHQuery, "queryForUserCuratedAssetsInMemory:options:", self->_backingMemory, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "executeQuery");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    userCuratedAssetsHelper = self->_userCuratedAssetsHelper;
    objc_msgSend(v8, "fetchedObjectIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](userCuratedAssetsHelper, "setOriginalObjectIDs:", v10);

  }
LABEL_5:
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array", (_QWORD)v21);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        PLObjectIDOrUUIDFromPHObject(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v18);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  -[PHChangeRequest didMutate](self, "didMutate");
  v19 = self->_userCuratedAssetsHelper;
  if (v14)
  {
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](v19, "setMutableObjectIDsAndUUIDs:", v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](v19, "setMutableObjectIDsAndUUIDs:", v20);

  }
}

- (void)setMovieStateData:(id)a3 forAsset:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[PHChangeRequest didMutate](self, "didMutate");
  -[PHChangeRequest helper](self, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mutations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("updatedMovieAssetState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("updatedMovieAssetState"));
    }
    objc_msgSend(v6, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, v10);
  }
  else
  {
    objc_msgSend(v8, "objectForKey:", CFSTR("deletedMovieAssetState"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKey:", v9, CFSTR("deletedMovieAssetState"));
    }
    objc_msgSend(v6, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v10);
  }

}

- (void)_setBackingMemory:(id)a3
{
  objc_storeStrong((id *)&self->_backingMemory, a3);
}

- (void)_prepareCustomUserAssetIDsIfNeeded
{
  void *v3;
  PHMemory *backingMemory;
  void *v5;
  void *v6;
  void *v7;
  PHRelationshipChangeRequestHelper *customUserAssetsHelper;
  void *v9;
  void *v10;
  PHRelationshipChangeRequestHelper *v11;
  id v12;
  void *v13;
  PHRelationshipChangeRequestHelper *v14;
  void *v15;
  id v16;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_customUserAssetsHelper, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    backingMemory = self->_backingMemory;
    if (!backingMemory)
      goto LABEL_7;
    -[PHObject photoLibrary](self->_backingMemory, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHQuery queryForCustomUserAssetsInMemory:options:](PHQuery, "queryForCustomUserAssetsInMemory:options:", backingMemory, v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "executeQuery");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    customUserAssetsHelper = self->_customUserAssetsHelper;
    objc_msgSend(v7, "fetchedObjectIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](customUserAssetsHelper, "setOriginalObjectIDs:", v9);

    -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_customUserAssetsHelper, "originalObjectIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v11 = self->_customUserAssetsHelper;
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](v11, "setOriginalObjectIDs:", v12);

    }
  }

LABEL_7:
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_customUserAssetsHelper, "mutableObjectIDsAndUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = self->_customUserAssetsHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](v14, "originalObjectIDs");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v16, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](v14, "setMutableObjectIDsAndUUIDs:", v15);

  }
}

- (void)setCustomUserAssets:(id)a3
{
  uint64_t v4;
  PHRelationshipChangeRequestHelper *customUserAssetsHelper;
  id v6;
  void *v7;
  id v8;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v8, "count");
  -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
  -[PHMemoryChangeRequest _prepareCustomUserAssetIDsIfNeeded](self, "_prepareCustomUserAssetIDsIfNeeded");
  customUserAssetsHelper = self->_customUserAssetsHelper;
  if (v4)
    v6 = (id)objc_msgSend(v8, "mutableCopy");
  else
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = v6;
  -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](customUserAssetsHelper, "setMutableObjectIDsAndUUIDs:", v6);

}

- (void)addCustomUserAssets:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
    -[PHMemoryChangeRequest _prepareCustomUserAssetIDsIfNeeded](self, "_prepareCustomUserAssetIDsIfNeeded");
    -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_customUserAssetsHelper, "mutableObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
}

- (void)insertCustomUserAssets:(id)a3 atIndexes:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
    -[PHMemoryChangeRequest _prepareCustomUserAssetIDsIfNeeded](self, "_prepareCustomUserAssetIDsIfNeeded");
    -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_customUserAssetsHelper, "mutableObjectIDsAndUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "insertObjects:atIndexes:", v6, v8);

  }
}

- (void)removeCustomUserAssets:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
    -[PHMemoryChangeRequest _prepareCustomUserAssetIDsIfNeeded](self, "_prepareCustomUserAssetIDsIfNeeded");
    -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_customUserAssetsHelper, "mutableObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsInArray:", v5);

  }
}

- (void)removeCustomUserAssetsAtIndexes:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
    -[PHMemoryChangeRequest _prepareCustomUserAssetIDsIfNeeded](self, "_prepareCustomUserAssetIDsIfNeeded");
    -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_customUserAssetsHelper, "mutableObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsAtIndexes:", v5);

  }
}

- (void)replaceCustomUserAssetsAtIndexes:(id)a3 withAssets:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
    -[PHMemoryChangeRequest _prepareCustomUserAssetIDsIfNeeded](self, "_prepareCustomUserAssetIDsIfNeeded");
    -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_customUserAssetsHelper, "mutableObjectIDsAndUUIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "replaceObjectsAtIndexes:withObjects:", v8, v6);

  }
}

- (void)moveCustomUserAssetsAtIndexes:(id)a3 toIndex:(unint64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "count"))
  {
    -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
    -[PHMemoryChangeRequest _prepareCustomUserAssetIDsIfNeeded](self, "_prepareCustomUserAssetIDsIfNeeded");
    -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_customUserAssetsHelper, "mutableObjectIDsAndUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectsAtIndexes:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectsAtIndexes:", v10);
    v8 = objc_msgSend(v10, "count");
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", a4, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertObjects:atIndexes:", v7, v9);

  }
}

- (void)setQueryHintObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHMemoryChangeRequest setQueryHintObjects:](self, "setQueryHintObjects:", v6, v7, v8);
}

- (void)setQueryHintObjects:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PHMemory assetListPredicateFromQueryHintObjects:](PHMemory, "assetListPredicateFromQueryHintObjects:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequest didMutate](self, "didMutate");
    -[PHChangeRequest helper](self, "helper");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject mutations](v6, "mutations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v5, CFSTR("assetListPredicate"));

  }
  else
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Unsupported queryHintObject %@ as assetListPredicate", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (PHMemoryFeature)blacklistedFeature
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("blacklistedFeature"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (v6)
      goto LABEL_8;
  }
  else
  {
    v7 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v7;
    _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed unarchiving blacklisted feature, error %@", buf, 0xCu);
  }
  v6 = 0;
LABEL_8:

  return (PHMemoryFeature *)v6;
}

- (void)setBlacklistedFeature:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v11, 1, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHChangeRequest helper](self, "helper");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mutations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, CFSTR("blacklistedFeature"));

    -[PHChangeRequest helper](self, "helper");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "nilMutations");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", CFSTR("blacklistedFeature"));

  }
  else
  {
    -[PHChangeRequest helper](self, "helper");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "mutations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("blacklistedFeature"));

    -[PHChangeRequest helper](self, "helper");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nilMutations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", CFSTR("blacklistedFeature"));
  }

}

- (void)setUserFeedback:(id)a3
{
  PHUserFeedback *v4;
  void *v5;
  PHUserFeedback *userFeedback;

  v4 = (PHUserFeedback *)a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  userFeedback = self->_userFeedback;
  self->_userFeedback = v4;

  if (!v4)
    self->_didUnsetUserFeedback = 1;
}

- (void)incrementPlayCount
{
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_incrementPlayCount = 1;
}

- (void)incrementShareCount
{
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_incrementShareCount = 1;
}

- (void)incrementViewCount
{
  -[PHChangeRequest didMutate](self, "didMutate");
  self->_incrementViewCount = 1;
}

- (id)_validateAssetCounts
{
  NSNumber *customMaximumNumberOfAssetsForUnitTesting;
  unint64_t v4;
  unint64_t v5;
  id v6;
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
  unint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  customMaximumNumberOfAssetsForUnitTesting = self->_customMaximumNumberOfAssetsForUnitTesting;
  if (customMaximumNumberOfAssetsForUnitTesting)
  {
    v4 = -[NSNumber integerValue](customMaximumNumberOfAssetsForUnitTesting, "integerValue");
    v5 = -[NSNumber integerValue](self->_customMaximumNumberOfAssetsForUnitTesting, "integerValue");
  }
  else
  {
    v5 = 5000;
    v4 = 512;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[PHMemoryChangeRequest representativeAssetsHelper](self, "representativeAssetsHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mutableObjectIDsAndUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v8);

  -[PHMemoryChangeRequest curatedAssetsHelper](self, "curatedAssetsHelper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mutableObjectIDsAndUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v10);

  -[PHMemoryChangeRequest extendedCuratedAssetsHelper](self, "extendedCuratedAssetsHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mutableObjectIDsAndUUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v12);

  -[PHMemoryChangeRequest userCuratedAssetsHelper](self, "userCuratedAssetsHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mutableObjectIDsAndUUIDs");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v14);

  -[PHMemoryChangeRequest movieCuratedAssetsHelper](self, "movieCuratedAssetsHelper");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "mutableObjectIDsAndUUIDs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v16);

  if (objc_msgSend(v6, "count") <= v4)
  {
    -[PHMemoryChangeRequest customUserAssetsHelper](self, "customUserAssetsHelper");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "mutableObjectIDsAndUUIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23 <= v5)
    {
      v20 = 0;
      goto LABEL_10;
    }
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2938];
    v25 = (void *)MEMORY[0x1E0CB3940];
    -[PHMemoryChangeRequest customUserAssetsHelper](self, "customUserAssetsHelper");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "mutableObjectIDsAndUUIDs");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringWithFormat:", CFSTR("Invalid number of custom user assets, count of assets: %lu maximum limit: %lu"), objc_msgSend(v19, "count"), v5);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v27);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2938];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid number of total assets, count of unique assets: %lu maximum limit: %lu"), objc_msgSend(v6, "count"), v4);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_10:
  return v20;
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  id v14;

  if (!-[PHMemoryChangeRequest clientEntitledToMemoryMutation](self, "clientEntitledToMemoryMutation", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericEntitlementError");
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v11 = 0;
    if (!a4)
      goto LABEL_11;
    goto LABEL_9;
  }
  -[PHMemoryChangeRequest title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend((id)objc_opt_class(), "validateMemoryTitle:error:", v6, &v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v14;

  if (!v7)
    goto LABEL_8;
  -[PHMemoryChangeRequest _validateAssetCounts](self, "_validateAssetCounts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v9 == 0;
  if (v9)
  {
    v12 = v9;

    v8 = v12;
  }

  if (a4)
  {
LABEL_9:
    if (!v11)
      *a4 = objc_retainAutorelease(v8);
  }
LABEL_11:

  return v11;
}

- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PHChangeRequest helper](self, "helper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v8 = objc_msgSend(v7, "validateMutationsToManagedObject:error:", v6, &v17);
  v9 = v17;

  if (v8)
  {
    -[PHMemoryChangeRequest _validateAssetCounts](self, "_validateAssetCounts");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
    }
    else
    {
      if (objc_msgSend(v6, "pendingState") != 3 || self->_userEdited)
      {
        v12 = 1;
        goto LABEL_11;
      }
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v18 = *MEMORY[0x1E0CB2938];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Change request for user edited memory requires 'userEdited' to be true."));
      v15 = objc_claimAutoreleasedReturnValue();
      v19[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v16);
      v11 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v15;
    }

    v9 = (id)v11;
  }
  if (a4)
  {
    v9 = objc_retainAutorelease(v9);
    v12 = 0;
    *a4 = v9;
  }
  else
  {
    v12 = 0;
  }
LABEL_11:

  return v12;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  -[PHMemoryChangeRequest creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)MEMORY[0x1E0D718D0];
  objc_msgSend(v6, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHChangeRequest uuid](self, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMemoryChangeRequest title](self, "title");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMemoryChangeRequest subtitle](self, "subtitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertIntoContext:withUUID:title:subtitle:creationDate:", v9, v10, v11, v12, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v13)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  BOOL v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[22];

  v23[21] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!-[PHMemoryChangeRequest clientEntitledToMemoryMutation](self, "clientEntitledToMemoryMutation"))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericEntitlementError");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("updatedMovieAssetState")) & 1) == 0
    && (objc_msgSend(v9, "isEqualToString:", CFSTR("deletedMovieAssetState")) & 1) == 0)
  {
    -[PHChangeRequest helper](self, "helper");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v14 = objc_msgSend(v13, "allowMutationToManagedObject:propertyKey:error:", v8, v9, &v20);
    v10 = v20;

    if (v14)
      goto LABEL_5;
LABEL_9:
    v12 = 0;
    if (!a5)
      goto LABEL_17;
    goto LABEL_15;
  }
  v10 = 0;
LABEL_5:
  v23[0] = CFSTR("rejected");
  v23[1] = CFSTR("favorite");
  v23[2] = CFSTR("pendingState");
  v23[3] = CFSTR("movieData");
  v23[4] = CFSTR("score");
  v23[5] = CFSTR("photosGraphData");
  v23[6] = CFSTR("photosGraphVersion");
  v23[7] = CFSTR("lastViewedDate");
  v23[8] = CFSTR("lastMoviePlayedDate");
  v23[9] = CFSTR("lastEnrichmentDate");
  v23[10] = CFSTR("assetListPredicate");
  v23[11] = CFSTR("title");
  v23[12] = CFSTR("subtitle");
  v23[13] = CFSTR("graphMemoryIdentifier");
  v23[14] = CFSTR("storyColorGradeKind");
  v23[15] = CFSTR("storySerializedTitleCategory");
  v23[16] = CFSTR("notificationState");
  v23[17] = CFSTR("blacklistedFeature");
  v23[18] = CFSTR("featuredState");
  v23[19] = CFSTR("updatedMovieAssetState");
  v23[20] = CFSTR("deletedMovieAssetState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PHChangeRequest isNewRequest](self, "isNewRequest") || (objc_msgSend(v11, "containsObject:", v9) & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid operation on property %@"), v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v12 = 0;
    v10 = (id)v18;
  }

  if (a5)
  {
LABEL_15:
    if (!v12)
      *a5 = objc_retainAutorelease(v10);
  }
LABEL_17:

  return v12;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  int v34;
  id v35;
  NSObject *v36;
  _BOOL4 v37;
  void *v38;
  _BOOL4 userCreated;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t i;
  uint64_t v88;
  void *v89;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  id v107;
  void *v108;
  uint64_t v109;
  void *v110;
  void *v111;
  id v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  id v117;
  void *v118;
  void *v119;
  int v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  char v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  BOOL v130;
  char v131;
  void *v132;
  void *v133;
  void *v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  id v139;
  id v140;
  id v141;
  id v142;
  id v143;
  id v144;
  id v145;
  id v146;
  id v147;
  _QWORD v148[4];
  id v149;
  _QWORD v150[4];
  id v151;
  id v152;
  _BYTE v153[128];
  uint64_t v154;
  void *v155;
  uint64_t v156;
  void *v157;
  uint64_t v158;
  void *v159;
  uint8_t buf[4];
  _BYTE v161[14];
  uint64_t v162;
  _QWORD v163[4];

  v163[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeEntityForNameInManagedObjectContext();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "entity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isKindOfEntity:", v9);

    if ((v11 & 1) != 0)
    {
      v12 = 0;
    }
    else
    {
      v14 = (void *)MEMORY[0x1E0CB35C8];
      v162 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid collection type"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v163[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v163, &v162, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v16);
      v12 = (id)objc_claimAutoreleasedReturnValue();

    }
    if (self->_userEdited && objc_msgSend(v7, "pendingState") == 2)
    {
      PLMemoriesGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        -[PHObject objectID](self->_backingMemory, "objectID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)v161 = v18;
        _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_DEFAULT, "Promoting memory with id: %{public}@ to userEdit...", buf, 0xCu);

      }
      v152 = 0;
      v19 = objc_msgSend(v7, "promoteToUserEditedMemoryWithError:", &v152);
      v20 = v152;
      if ((v19 & 1) == 0)
      {
        PLMemoriesGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)v161 = v20;
          _os_log_impl(&dword_1991EC000, v21, OS_LOG_TYPE_ERROR, "Failed to promote with error: %@", buf, 0xCu);
        }

        v11 = 0;
      }

    }
    -[PHChangeRequest helper](self, "helper");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "mutations");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "objectForKey:", CFSTR("updatedMovieAssetState"));
    v24 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", CFSTR("deletedMovieAssetState"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v11)
    {
      v133 = (void *)v24;
      v134 = (void *)v25;
      if (v24 | v25)
      {
        v27 = v23;
        objc_msgSend(v7, "valueForKey:", CFSTR("movieAssetState"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = (void *)objc_msgSend(v28, "mutableCopy");

        if (!v29)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v30 = MEMORY[0x1E0C809B0];
        v150[0] = MEMORY[0x1E0C809B0];
        v150[1] = 3221225472;
        v150[2] = __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke;
        v150[3] = &unk_1E35D86F8;
        v31 = v29;
        v151 = v31;
        objc_msgSend(v133, "enumerateKeysAndObjectsUsingBlock:", v150);
        v148[0] = v30;
        v148[1] = 3221225472;
        v148[2] = __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_2;
        v148[3] = &unk_1E35D8720;
        v149 = v31;
        v32 = v31;
        objc_msgSend(v134, "enumerateObjectsUsingBlock:", v148);
        objc_msgSend(v7, "setValue:forKey:", v32, CFSTR("movieAssetState"));
        v23 = v27;
        objc_msgSend(v27, "removeObjectForKey:", CFSTR("updatedMovieAssetState"));
        objc_msgSend(v27, "removeObjectForKey:", CFSTR("deletedMovieAssetState"));

      }
      v130 = -[PHChangeRequest isNewRequest](self, "isNewRequest");
      -[PHChangeRequest helper](self, "helper");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v147 = v12;
      v34 = objc_msgSend(v33, "applyMutationsToManagedObject:error:", v7, &v147);
      v35 = v147;

      if (v34)
      {
        PLPhotoKitGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        {
          v37 = -[PHChangeRequest isMutated](self, "isMutated");
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v161 = v37;
          *(_WORD *)&v161[4] = 2112;
          *(_QWORD *)&v161[6] = v23;
          _os_log_impl(&dword_1991EC000, v36, OS_LOG_TYPE_DEBUG, "##### isMutated %d mutations %@ will update", buf, 0x12u);
        }

        if (self->_incrementPlayCount)
          objc_msgSend(v7, "setPendingPlayCount:", objc_msgSend(v7, "pendingPlayCount") + 1);
        if (self->_incrementShareCount)
          objc_msgSend(v7, "setPendingShareCount:", objc_msgSend(v7, "pendingShareCount") + 1);
        if (self->_incrementViewCount)
          objc_msgSend(v7, "setPendingViewCount:", objc_msgSend(v7, "pendingViewCount") + 1);
        if (self->_didSetUserCreated)
        {
          v38 = v23;
          userCreated = self->_userCreated;
          v40 = objc_msgSend(v7, "userActionOptions") & 0xFFFE | userCreated;
          v23 = v38;
          objc_msgSend(v7, "setUserActionOptions:", v40);
        }
        if (-[PHMemoryChangeRequest creationType](self, "creationType") == 1)
          objc_msgSend(v7, "recalculateUserActionOptionsBit");
        -[PHMemoryChangeRequest representativeAssetsHelper](self, "representativeAssetsHelper");
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v129, "mutableObjectIDsAndUUIDs");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "count");

        if (v42)
        {
          if (!v130)
          {
            v56 = (void *)MEMORY[0x1E0CB35C8];
            v158 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Memories representative assets cannot be mutated"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v159 = v57;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v159, &v158, 1);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v58);
            v47 = (id)objc_claimAutoreleasedReturnValue();

            -[PHMemoryChangeRequest curatedAssetsHelper](self, "curatedAssetsHelper");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_53;
          }
          v43 = v7;
          objc_msgSend(v129, "setAllowsInsert:", 1);
          objc_msgSend(MEMORY[0x1E0D71880], "entityName");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "setDestinationEntityName:", v44);

          objc_msgSend(v129, "setIsDestinationObjectValid:", &__block_literal_global_147);
          objc_msgSend(v129, "relationshipName");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "mutableSetValueForKey:", v45);
          v46 = (void *)objc_claimAutoreleasedReturnValue();

          v146 = v35;
          LODWORD(v45) = objc_msgSend(v129, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v43, v46, &v146);

          v47 = v146;
          -[PHMemoryChangeRequest curatedAssetsHelper](self, "curatedAssetsHelper");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v47;
          if (!(_DWORD)v45)
            goto LABEL_53;
        }
        else
        {
          -[PHMemoryChangeRequest curatedAssetsHelper](self, "curatedAssetsHelper");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v48, "mutableObjectIDsAndUUIDs");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "count");

        if (!v50)
        {
          -[PHMemoryChangeRequest extendedCuratedAssetsHelper](self, "extendedCuratedAssetsHelper");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = v35;
          goto LABEL_48;
        }
        if (v130)
        {
          v51 = v7;
          objc_msgSend(v48, "setAllowsInsert:", 1);
          objc_msgSend(MEMORY[0x1E0D71880], "entityName");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setDestinationEntityName:", v52);

          objc_msgSend(v48, "setIsDestinationObjectValid:", &__block_literal_global_151);
          objc_msgSend(v48, "relationshipName");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "mutableSetValueForKey:", v53);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          v145 = v35;
          LODWORD(v53) = objc_msgSend(v48, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v51, v54, &v145);

          v47 = v145;
          -[PHMemoryChangeRequest extendedCuratedAssetsHelper](self, "extendedCuratedAssetsHelper");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          if (!(_DWORD)v53)
            goto LABEL_54;
LABEL_48:
          v122 = v47;
          v128 = v55;
          objc_msgSend(v55, "mutableObjectIDsAndUUIDs");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "count");

          if (v60)
          {
            if (!v130)
            {
              v95 = (void *)MEMORY[0x1E0CB35C8];
              v154 = *MEMORY[0x1E0CB2D50];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Memories extended curated assets cannot be mutated"));
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              v155 = v96;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v155, &v154, 1);
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v97);
              v47 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_55;
            }
            v61 = v7;
            objc_msgSend(v128, "setAllowsInsert:", 1);
            objc_msgSend(MEMORY[0x1E0D71880], "entityName");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v128, "setDestinationEntityName:", v62);

            objc_msgSend(v128, "setIsDestinationObjectValid:", &__block_literal_global_154_11926);
            objc_msgSend(v128, "relationshipName");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v61, "mutableSetValueForKey:", v63);
            v64 = (void *)objc_claimAutoreleasedReturnValue();

            v144 = v122;
            v131 = objc_msgSend(v128, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v61, v64, &v144);

            v12 = v144;
            -[PHMemoryChangeRequest keyAssetHelper](self, "keyAssetHelper");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v131 & 1) == 0)
            {
LABEL_56:
              v26 = v134;
              -[PHMemoryChangeRequest movieCuratedAssetsHelper](self, "movieCuratedAssetsHelper");
              v126 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_57:
              v127 = v48;
              -[PHMemoryChangeRequest userCuratedAssetsHelper](self, "userCuratedAssetsHelper");
              v124 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_58:
              v132 = v65;
              -[PHMemoryChangeRequest customUserAssetsHelper](self, "customUserAssetsHelper");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_59:
              -[PHMemoryChangeRequest userRemovedAssetsHelper](self, "userRemovedAssetsHelper");
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              v72 = 0;
              goto LABEL_60;
            }
            v122 = v12;
          }
          else
          {
            -[PHMemoryChangeRequest keyAssetHelper](self, "keyAssetHelper");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v65, "mutableObjectIDsAndUUIDs");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v92 = objc_msgSend(v91, "count");

          if (v92)
          {
            objc_msgSend(v65, "setAllowsInsert:", 1);
            objc_msgSend(MEMORY[0x1E0D71880], "entityName");
            v93 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "setDestinationEntityName:", v93);

            objc_msgSend(v65, "setIsDestinationObjectValid:", &__block_literal_global_157);
            v143 = v122;
            LOBYTE(v93) = objc_msgSend(v65, "applyMutationsToManagedObjectToOneRelationship:error:", v7, &v143);
            v12 = v143;

            -[PHMemoryChangeRequest movieCuratedAssetsHelper](self, "movieCuratedAssetsHelper");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v93 & 1) == 0)
            {
              v126 = v94;
              v26 = v134;
              goto LABEL_57;
            }
            v122 = v12;
          }
          else
          {
            -[PHMemoryChangeRequest movieCuratedAssetsHelper](self, "movieCuratedAssetsHelper");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v98 = v94;
          objc_msgSend(v94, "mutableObjectIDsAndUUIDs");
          v99 = (void *)objc_claimAutoreleasedReturnValue();

          v126 = v98;
          v127 = v48;
          v132 = v65;
          if (v99)
          {
            v100 = v7;
            objc_msgSend(v98, "setAllowsInsert:", 1);
            objc_msgSend(v98, "setAllowsRemove:", 1);
            objc_msgSend(MEMORY[0x1E0D71880], "entityName");
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v98, "setDestinationEntityName:", v101);

            objc_msgSend(v98, "setIsDestinationObjectValid:", &__block_literal_global_158);
            objc_msgSend(v98, "relationshipName");
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "mutableSetValueForKey:", v102);
            v103 = (void *)objc_claimAutoreleasedReturnValue();

            v142 = v122;
            v125 = objc_msgSend(v98, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v100, v103, &v142);

            v12 = v142;
            -[PHMemoryChangeRequest userCuratedAssetsHelper](self, "userCuratedAssetsHelper");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v125 & 1) == 0)
            {
              v124 = v104;
              v26 = v134;
              v65 = v132;
              goto LABEL_58;
            }
            v122 = v12;
          }
          else
          {
            -[PHMemoryChangeRequest userCuratedAssetsHelper](self, "userCuratedAssetsHelper");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v105 = v104;
          objc_msgSend(v104, "mutableObjectIDsAndUUIDs");
          v106 = (void *)objc_claimAutoreleasedReturnValue();

          v124 = v105;
          if (v106)
          {
            v107 = v7;
            objc_msgSend(v105, "setAllowsInsert:", 1);
            objc_msgSend(v105, "setAllowsRemove:", 1);
            objc_msgSend(MEMORY[0x1E0D71880], "entityName");
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v105, "setDestinationEntityName:", v108);

            objc_msgSend(v105, "setIsDestinationObjectValid:", &__block_literal_global_159);
            objc_msgSend(v105, "relationshipName");
            v109 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "mutableSetValueForKey:", v109);
            v110 = (void *)objc_claimAutoreleasedReturnValue();

            v141 = v122;
            LOBYTE(v109) = objc_msgSend(v105, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v107, v110, &v141);

            v12 = v141;
            -[PHMemoryChangeRequest customUserAssetsHelper](self, "customUserAssetsHelper");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v109 & 1) == 0)
            {
              v26 = v134;
              goto LABEL_59;
            }
            v122 = v12;
          }
          else
          {
            -[PHMemoryChangeRequest customUserAssetsHelper](self, "customUserAssetsHelper");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v70, "mutableObjectIDsAndUUIDs");
          v111 = (void *)objc_claimAutoreleasedReturnValue();

          if (v111)
          {
            v112 = v7;
            objc_msgSend(v70, "setAllowsInsert:", 1);
            objc_msgSend(v70, "setAllowsRemove:", 1);
            objc_msgSend(v70, "setAllowsMove:", 1);
            objc_msgSend(MEMORY[0x1E0D71880], "entityName");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "setDestinationEntityName:", v113);

            objc_msgSend(v70, "relationshipName");
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "mutableOrderedSetValueForKey:", v114);
            v115 = (void *)objc_claimAutoreleasedReturnValue();

            v140 = v122;
            v120 = objc_msgSend(v70, "applyMutationsToManagedObject:orderedMutableChildren:error:", v112, v115, &v140);

            v12 = v140;
            -[PHMemoryChangeRequest userRemovedAssetsHelper](self, "userRemovedAssetsHelper");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v120)
            {
              v72 = 0;
LABEL_104:
              v26 = v134;
LABEL_60:

              if (v72)
              {
                v73 = v7;
                v74 = v73;
                v123 = v23;
                if (self->_userFeedback)
                {
                  v75 = (void *)MEMORY[0x1E0D71BB0];
                  objc_msgSend(v73, "userFeedbacks");
                  v76 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v75, "newestUserFeedbackInSet:", v76);
                  v77 = (void *)objc_claimAutoreleasedReturnValue();

                  if (!v77)
                  {
                    v78 = (void *)MEMORY[0x1E0D71BB0];
                    objc_msgSend(v74, "managedObjectContext");
                    v79 = (void *)objc_claimAutoreleasedReturnValue();
                    -[PHUserFeedback uuid](self->_userFeedback, "uuid");
                    v80 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v78, "insertIntoManagedObjectContext:withUUID:", v79, v80);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v77, "setMemory:", v74);
                  }
                  objc_msgSend(v77, "setType:", (__int16)-[PHUserFeedback type](self->_userFeedback, "type"));
                  objc_msgSend(v77, "setFeature:", (__int16)-[PHUserFeedback feature](self->_userFeedback, "feature"));
                  -[PHUserFeedback context](self->_userFeedback, "context");
                  v81 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "setContext:", v81);

                  -[PHUserFeedback lastModifiedDate](self->_userFeedback, "lastModifiedDate");
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v77, "setLastModifiedDate:", v82);

                  v26 = v134;
                }
                if (self->_didUnsetUserFeedback)
                {
                  v137 = 0u;
                  v138 = 0u;
                  v135 = 0u;
                  v136 = 0u;
                  objc_msgSend(v74, "userFeedbacks");
                  v83 = (void *)objc_claimAutoreleasedReturnValue();
                  v84 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v135, v153, 16);
                  if (v84)
                  {
                    v85 = v84;
                    v86 = *(_QWORD *)v136;
                    do
                    {
                      for (i = 0; i != v85; ++i)
                      {
                        if (*(_QWORD *)v136 != v86)
                          objc_enumerationMutation(v83);
                        v88 = *(_QWORD *)(*((_QWORD *)&v135 + 1) + 8 * i);
                        objc_msgSend(v74, "managedObjectContext");
                        v89 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v89, "deleteObject:", v88);

                      }
                      v85 = objc_msgSend(v83, "countByEnumeratingWithState:objects:count:", &v135, v153, 16);
                    }
                    while (v85);
                  }

                  v23 = v123;
                  v26 = v134;
                }

                v13 = 1;
                v24 = (uint64_t)v133;
                goto LABEL_77;
              }
              v24 = (uint64_t)v133;
              if (!a5)
                goto LABEL_76;
LABEL_40:
              v12 = objc_retainAutorelease(v12);
              v13 = 0;
              *a5 = v12;
LABEL_77:

              goto LABEL_78;
            }
            v122 = v12;
          }
          else
          {
            -[PHMemoryChangeRequest userRemovedAssetsHelper](self, "userRemovedAssetsHelper");
            v71 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v71, "mutableObjectIDsAndUUIDs");
          v116 = (void *)objc_claimAutoreleasedReturnValue();

          if (v116)
          {
            v117 = v7;
            objc_msgSend(v71, "setAllowsInsert:", 1);
            objc_msgSend(v71, "setAllowsRemove:", 1);
            objc_msgSend(v71, "setAllowsMove:", 0);
            objc_msgSend(MEMORY[0x1E0D71880], "entityName");
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setDestinationEntityName:", v118);

            objc_msgSend(v71, "relationshipName");
            v119 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v117, "mutableSetValueForKey:", v119);
            v121 = (void *)objc_claimAutoreleasedReturnValue();

            v139 = v122;
            v72 = objc_msgSend(v71, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v117, v121, &v139);

            v12 = v139;
          }
          else
          {
            v72 = 1;
            v12 = v122;
          }
          goto LABEL_104;
        }
        v66 = (void *)MEMORY[0x1E0CB35C8];
        v156 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Memories curated assets cannot be mutated"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        v157 = v67;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v157, &v156, 1);
        v68 = v48;
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3300, v69);
        v47 = (id)objc_claimAutoreleasedReturnValue();

        v48 = v68;
LABEL_53:
        -[PHMemoryChangeRequest extendedCuratedAssetsHelper](self, "extendedCuratedAssetsHelper");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_54:
        v128 = v55;
LABEL_55:
        -[PHMemoryChangeRequest keyAssetHelper](self, "keyAssetHelper");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v47;
        goto LABEL_56;
      }
      v12 = v35;
      v24 = (uint64_t)v133;
      v26 = v134;
      if (a5)
        goto LABEL_40;
    }
    else
    {
      -[PHChangeRequest isNewRequest](self, "isNewRequest");
      if (a5)
        goto LABEL_40;
    }
LABEL_76:
    v13 = 0;
    goto LABEL_77;
  }
  v13 = 0;
LABEL_78:

  return v13;
}

- (void)_prepareExistingUserRemovedAssetIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  PHRelationshipChangeRequestHelper *v13;
  _QWORD v14[4];
  id v15;
  PHMemoryChangeRequest *v16;
  id v17;

  v13 = self->_userRemovedAssetsHelper;
  -[PHRelationshipChangeRequestHelper originalObjectIDs](v13, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (-[PHChangeRequest isNewRequest](self, "isNewRequest"))
    {
      -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](v13, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
    }
    else
    {
      +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "photoLibrary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "managedObjectContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __60__PHMemoryChangeRequest__prepareExistingUserRemovedAssetIDs__block_invoke;
      v14[3] = &unk_1E35DFAF8;
      v15 = v6;
      v16 = self;
      v17 = v7;
      v8 = v7;
      v9 = v6;
      objc_msgSend(v9, "performBlockAndWait:", v14);
      -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](v13, "setOriginalObjectIDs:", v8);

    }
  }
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](v13, "mutableObjectIDsAndUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[PHRelationshipChangeRequestHelper originalObjectIDs](v13, "originalObjectIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](v13, "setMutableObjectIDsAndUUIDs:", v12);

  }
}

- (void)setUserRemovedAssets:(id)a3
{
  uint64_t v4;
  PHRelationshipChangeRequestHelper *userRemovedAssetsHelper;
  id v6;
  void *v7;
  id v8;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v8, "count");
  -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
  if (v4)
  {
    -[PHMemoryChangeRequest _prepareExistingUserRemovedAssetIDs](self, "_prepareExistingUserRemovedAssetIDs");
    userRemovedAssetsHelper = self->_userRemovedAssetsHelper;
    v6 = (id)objc_msgSend(v8, "mutableCopy");
  }
  else
  {
    -[PHMemoryChangeRequest _prepareCustomUserAssetIDsIfNeeded](self, "_prepareCustomUserAssetIDsIfNeeded");
    userRemovedAssetsHelper = self->_userRemovedAssetsHelper;
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  v7 = v6;
  -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](userRemovedAssetsHelper, "setMutableObjectIDsAndUUIDs:", v6);

}

- (void)removeUserAssets:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
    -[PHMemoryChangeRequest _prepareExistingUserRemovedAssetIDs](self, "_prepareExistingUserRemovedAssetIDs");
    -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_userRemovedAssetsHelper, "mutableObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v5);

  }
}

- (void)undoUserRemoveForAssets:(id)a3
{
  void *v4;
  id v5;

  +[PHRelationshipChangeRequestHelper objectIDsOrUUIDsFromPHObjects:](PHRelationshipChangeRequestHelper, "objectIDsOrUUIDsFromPHObjects:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PHChangeRequestHelper didMutate](self->super._helper, "didMutate");
    -[PHMemoryChangeRequest _prepareExistingUserRemovedAssetIDs](self, "_prepareExistingUserRemovedAssetIDs");
    -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_userRemovedAssetsHelper, "mutableObjectIDsAndUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectsInArray:", v5);

  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)PHMemoryChangeRequest;
  -[PHMemoryChangeRequest description](&v19, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMemoryChangeRequest title](self, "title");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMemoryChangeRequest representativeAssetsHelper](self, "representativeAssetsHelper");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "mutableObjectIDsAndUUIDs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v17, "count");
  -[PHMemoryChangeRequest curatedAssetsHelper](self, "curatedAssetsHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mutableObjectIDsAndUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  -[PHMemoryChangeRequest extendedCuratedAssetsHelper](self, "extendedCuratedAssetsHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mutableObjectIDsAndUUIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  -[PHMemoryChangeRequest keyAssetHelper](self, "keyAssetHelper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mutableObjectIDsAndUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" title=%@ representativeAssets=%d curatedAssets=%d extendedCuratedAssets=%d keyAsset=%@"), v16, v15, v6, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v13;
}

- (BOOL)clientEntitledToMemoryMutation
{
  return self->_clientEntitledToMemoryMutation;
}

- (BOOL)userEdited
{
  return self->_userEdited;
}

- (NSDictionary)movieAssetState
{
  return self->_movieAssetState;
}

- (PHUserFeedback)userFeedback
{
  return self->_userFeedback;
}

- (NSNumber)customMaximumNumberOfAssetsForUnitTesting
{
  return self->_customMaximumNumberOfAssetsForUnitTesting;
}

- (void)setCustomMaximumNumberOfAssetsForUnitTesting:(id)a3
{
  objc_storeStrong((id *)&self->_customMaximumNumberOfAssetsForUnitTesting, a3);
}

- (PHRelationshipChangeRequestHelper)keyAssetHelper
{
  return self->_keyAssetHelper;
}

- (PHRelationshipChangeRequestHelper)representativeAssetsHelper
{
  return self->_representativeAssetsHelper;
}

- (PHRelationshipChangeRequestHelper)curatedAssetsHelper
{
  return self->_curatedAssetsHelper;
}

- (PHRelationshipChangeRequestHelper)extendedCuratedAssetsHelper
{
  return self->_extendedCuratedAssetsHelper;
}

- (PHRelationshipChangeRequestHelper)movieCuratedAssetsHelper
{
  return self->_movieCuratedAssetsHelper;
}

- (PHRelationshipChangeRequestHelper)userCuratedAssetsHelper
{
  return self->_userCuratedAssetsHelper;
}

- (PHRelationshipChangeRequestHelper)customUserAssetsHelper
{
  return self->_customUserAssetsHelper;
}

- (PHRelationshipChangeRequestHelper)userRemovedAssetsHelper
{
  return self->_userRemovedAssetsHelper;
}

- (NSManagedObjectID)sourceGeneratedMemoryID
{
  return self->_sourceGeneratedMemoryID;
}

- (void)setSourceGeneratedMemoryID:(id)a3
{
  objc_storeStrong((id *)&self->_sourceGeneratedMemoryID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceGeneratedMemoryID, 0);
  objc_storeStrong((id *)&self->_userRemovedAssetsHelper, 0);
  objc_storeStrong((id *)&self->_customUserAssetsHelper, 0);
  objc_storeStrong((id *)&self->_userCuratedAssetsHelper, 0);
  objc_storeStrong((id *)&self->_movieCuratedAssetsHelper, 0);
  objc_storeStrong((id *)&self->_extendedCuratedAssetsHelper, 0);
  objc_storeStrong((id *)&self->_curatedAssetsHelper, 0);
  objc_storeStrong((id *)&self->_representativeAssetsHelper, 0);
  objc_storeStrong((id *)&self->_keyAssetHelper, 0);
  objc_storeStrong((id *)&self->_customMaximumNumberOfAssetsForUnitTesting, 0);
  objc_storeStrong((id *)&self->_userFeedback, 0);
  objc_storeStrong((id *)&self->_movieAssetState, 0);
  objc_storeStrong((id *)&self->_backingMemory, 0);
}

void __60__PHMemoryChangeRequest__prepareExistingUserRemovedAssetIDs__block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  objc_msgSend(*(id *)(a1[5] + 32), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v2, "existingObjectWithID:error:", v3, &v18);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v18;

  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v4, "userRemovedAssets", 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          v11 = (void *)a1[6];
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "objectID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v12);

        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v23, 16);
      }
      while (v8);
    }
  }
  else
  {
    PLPhotoKitGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1[5] + 32), "objectID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v13;
      v21 = 2112;
      v22 = v5;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "Unable to load existing memory with id: %@, error: %@", buf, 0x16u);

    }
  }

}

uint64_t __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", a3, a2);
}

uint64_t __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", a2);
}

uint64_t __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCloudSharedAsset") ^ 1;
}

uint64_t __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCloudSharedAsset") ^ 1;
}

uint64_t __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCloudSharedAsset") ^ 1;
}

uint64_t __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCloudSharedAsset") ^ 1;
}

uint64_t __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_2_150(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCloudSharedAsset") ^ 1;
}

uint64_t __74__PHMemoryChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_145(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCloudSharedAsset") ^ 1;
}

uint64_t __69__PHMemoryChangeRequest_initWithXPCDict_request_clientAuthorization___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setMutated:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "recordUpdateRequest:", *(_QWORD *)(a1 + 32));
}

+ (id)creationRequestForMemoryWithTitle:(id)a3 subtitle:(id)a4 creationDate:(id)a5 category:(unint64_t)a6 subcategory:(unint64_t)a7 representativeAssets:(id)a8 curatedAssets:(id)a9 extendedCuratedAssets:(id)a10 keyAsset:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v16 = a11;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = -[PHMemoryChangeRequest initForNewObject]([PHMemoryChangeRequest alloc], "initForNewObject");
  objc_msgSend(v23, "setTitle:", v22);

  objc_msgSend(v23, "setSubtitle:", v21);
  objc_msgSend(v23, "setCreationDate:", v20);

  objc_msgSend(v23, "setCategory:", a6);
  objc_msgSend(v23, "setSubcategory:", a7);
  objc_msgSend(v23, "setRepresentativeAssets:curatedAssets:extendedCuratedAssets:keyAsset:", v19, v18, v17, v16);

  return v23;
}

+ (id)creationRequestForMemoryWithTitle:(id)a3 subtitle:(id)a4 creationDate:(id)a5 category:(unint64_t)a6 subcategory:(unint64_t)a7 representativeAssetUUIDs:(id)a8 curatedAssetUUIDs:(id)a9 extendedCuratedAssetUUIDs:(id)a10 keyAssetUUID:(id)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v16 = a11;
  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = -[PHMemoryChangeRequest initForNewObject]([PHMemoryChangeRequest alloc], "initForNewObject");
  objc_msgSend(v23, "setTitle:", v22);

  objc_msgSend(v23, "setSubtitle:", v21);
  objc_msgSend(v23, "setCreationDate:", v20);

  objc_msgSend(v23, "setCategory:", a6);
  objc_msgSend(v23, "setSubcategory:", a7);
  objc_msgSend(v23, "setRepresentativeAssetUUIDs:curatedAssetUUIDs:extendedCuratedAssetUUIDs:keyAssetUUID:", v19, v18, v17, v16);

  return v23;
}

+ (id)preferredAttributesForMemoryCreationFromAssetCollection:(id)a3 proposedAttributes:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v19;
  id v20;
  id v21;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "_shouldAcceptProposedAttributes:", v7))
  {
    v8 = v7;
  }
  else
  {
    v9 = objc_msgSend(a1, "_titleFormatForProposedAttributes:", v7);
    objc_msgSend(v6, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "photoAnalysisClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "localIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v21 = 0;
    v19 = 0;
    v14 = objc_msgSend(v12, "requestTitleForAssetCollectionWithLocalIdentifier:format:title:subtitle:error:", v13, v9, &v21, &v20, &v19);
    v15 = v21;
    v16 = v20;
    v17 = v19;

    objc_msgSend(a1, "_preferredAttributesForMemoryCreationFromObject:withSuccess:title:subtitle:error:proposedAttributes:", v6, v14, v15, v16, v17, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)preferredAttributesForMemoryCreationFromCollectionList:(id)a3 proposedAttributes:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "_shouldAcceptProposedAttributes:", v7))
  {
    v8 = v7;
  }
  else
  {
    v9 = objc_msgSend(a1, "_titleFormatForProposedAttributes:", v7);
    objc_msgSend(v6, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "photoAnalysisClient");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "localIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v20 = 0;
    v18 = 0;
    v13 = objc_msgSend(v11, "requestTitleForCollectionMomentListWithLocalIdentifier:format:title:subtitle:error:", v12, v9, &v20, &v19, &v18);
    v14 = v20;
    v15 = v19;
    v16 = v18;

    objc_msgSend(a1, "_preferredAttributesForMemoryCreationFromObject:withSuccess:title:subtitle:error:proposedAttributes:", v6, v13, v14, v15, v16, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)preferredAttributesForMemoryCreationFromPeople:(id)a3 proposedAttributes:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v26;
  id v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "_shouldAcceptProposedAttributes:", v7))
  {
    v8 = v7;
  }
  else
  {
    v9 = objc_msgSend(a1, "_titleFormatForProposedAttributes:", v7);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v26 = v6;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          if (!v14)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "photoLibrary");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v17, "localIdentifier", v26);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "addObject:", v18);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }

    objc_msgSend(v14, "photoLibrary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "photoAnalysisClient");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0;
    v29 = 0;
    v27 = 0;
    v21 = objc_msgSend(v20, "requestTitleForPersonLocalIdentifiers:format:title:subtitle:error:", v10, v9, &v29, &v28, &v27);
    v22 = v29;
    v23 = v28;
    v24 = v27;
    objc_msgSend(a1, "_preferredAttributesForMemoryCreationFromObject:withSuccess:title:subtitle:error:proposedAttributes:", v11, v21, v22, v23, v24, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v26;
  }

  return v8;
}

+ (BOOL)_shouldAcceptProposedAttributes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PHMemoryCreationAttributeTitleKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PHMemoryCreationAttributeTitleCategoryKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    if (v6 == 5)
    {
      LOBYTE(v4) = 0;
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PHMemoryCreationAttributeSubtitleKey"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v4) = v7 != 0;

    }
  }

  return (char)v4;
}

+ (int64_t)_titleFormatForProposedAttributes:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PHMemoryCreationAttributeTitleKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PHMemoryCreationAttributeTitleCategoryKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "integerValue") == 5)
      v6 = 2;
    else
      v6 = 3;

  }
  else
  {
    v6 = 2;
  }

  return v6;
}

+ (id)_preferredAttributesForMemoryCreationFromObject:(id)a3 withSuccess:(BOOL)a4 title:(id)a5 subtitle:(id)a6 error:(id)a7 proposedAttributes:(id)a8
{
  _BOOL4 v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v12 = a4;
  v31 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PHMemoryCreationAttributeTitleKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PHMemoryCreationAttributeTitleCategoryKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "integerValue");

  objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("PHMemoryCreationAttributeSubtitleKey"));
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (!v18 || v20 == 5)
    {
      v23 = v14;

      v20 = 5;
      v18 = v23;
      if (!v21)
LABEL_10:
        v21 = v15;
    }
    else if (!v21)
    {
      goto LABEL_10;
    }
  }
  else
  {
    PLMemoriesGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 138412546;
      v28 = v13;
      v29 = 2112;
      v30 = v16;
      _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_DEFAULT, "Failed to request preferred attributes for memory creation from %@: %@", (uint8_t *)&v27, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v18, CFSTR("PHMemoryCreationAttributeTitleKey"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, CFSTR("PHMemoryCreationAttributeTitleCategoryKey"));

  objc_msgSend(v24, "setObject:forKeyedSubscript:", v21, CFSTR("PHMemoryCreationAttributeSubtitleKey"));
  return v24;
}

+ (id)changeRequestForMemory:(id)a3
{
  id v3;
  PHMemoryChangeRequest *v4;
  void *v5;
  void *v6;
  PHMemoryChangeRequest *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = [PHMemoryChangeRequest alloc];
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PHMemoryChangeRequest initWithUUID:objectID:](v4, "initWithUUID:objectID:", v5, v6);

    -[PHMemoryChangeRequest _setBackingMemory:](v7, "_setBackingMemory:", v3);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)validateMemoryTitle:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v5 = validateMemoryTitle_error__onceToken;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&validateMemoryTitle_error__onceToken, &__block_literal_global_12071);
  objc_msgSend(v6, "stringByTrimmingCharactersInSet:", validateMemoryTitle_error__characterSet);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
  {
    v8 = 0;
    if (!a4)
      goto LABEL_9;
  }
  else
  {

    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3300, CFSTR("Empty title unsupported"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    if (!a4)
      goto LABEL_9;
  }
  if (!v7)
    *a4 = objc_retainAutorelease(v8);
LABEL_9:

  return v7;
}

+ (void)deleteMemories:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:ofType:forSelector:](PHMemoryDeleteRequest, "deleteRequestsForObjects:ofType:forSelector:", v5, objc_opt_class(), a2);

}

+ (void)blockPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = CFSTR("PHFacePropertySetIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFetchPropertySets:", v7);

    +[PHFace fetchKeyFaceForPerson:options:](PHFace, "fetchKeyFaceForPerson:options:", v4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "librarySpecificFetchOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = CFSTR("PHAssetPropertySetIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFetchPropertySets:", v10);

    objc_msgSend(v9, "setFetchLimit:", 1);
    objc_msgSend(v8, "fetchedObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHAsset fetchAssetsForFaces:options:](PHAsset, "fetchAssetsForFaces:options:", v11, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "blockPerson:withAsset:", v4, v13);
  }
}

+ (void)blockPerson:(id)a3 withAsset:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  id v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(v5, "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v24[0] = CFSTR("PHAssetPropertySetIdentifier");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFetchPropertySets:", v9);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSortDescriptors:", v11);

    objc_msgSend(v8, "setFetchLimit:", 10);
    +[PHAsset fetchAssetsForPerson:options:](PHAsset, "fetchAssetsForPerson:options:", v5, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchedObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v6)
    {
      if ((objc_msgSend(v13, "containsObject:", v6) & 1) == 0)
      {
        objc_msgSend(v14, "arrayByAddingObject:", v6);
        v15 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v15;
      }
    }
    else
    {
      objc_msgSend(v13, "firstObject");
      v16 = objc_claimAutoreleasedReturnValue();
      if (!v16)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v22 = v5;
          _os_log_error_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed blocking person %@, no representative asset found", buf, 0xCu);
        }
        v6 = 0;
        goto LABEL_8;
      }
      v6 = (id)v16;
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHMemoryChangeRequest creationRequestForMemoryWithTitle:subtitle:creationDate:category:subcategory:representativeAssets:curatedAssets:extendedCuratedAssets:keyAsset:](PHMemoryChangeRequest, "creationRequestForMemoryWithTitle:subtitle:creationDate:category:subcategory:representativeAssets:curatedAssets:extendedCuratedAssets:keyAsset:", CFSTR("_"), 0, v17, 401, 204, v14, v14, v14, v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "setUserCreated:", 1);
    objc_msgSend(v18, "setPendingState:", 0);
    objc_msgSend(v18, "setRejected:", 1);
    objc_msgSend(v5, "localIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHMemoryFeature peopleMemoryFeatureWithPersonLocalIdentifier:](PHMemoryFeature, "peopleMemoryFeatureWithPersonLocalIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBlacklistedFeature:", v20);

LABEL_8:
  }

}

+ (void)unblockPersonsInMemoriesWithBlockedPersonFeature:(id)a3
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
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        objc_msgSend(v11, "blacklistedFeature");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "type");

        if (v13 != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHMemoryChangeRequest.m"), 987, CFSTR("Memory does not contain a blocked feature of type PHMemoryFeatureTypePeoplePerson."));

        }
        if (objc_msgSend(v11, "category") == 401)
        {
          objc_msgSend(v5, "addObject:", v11);
        }
        else
        {
          +[PHMemoryChangeRequest changeRequestForMemory:](PHMemoryChangeRequest, "changeRequestForMemory:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setBlacklistedFeature:", 0);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v5, "count"))
    objc_msgSend(a1, "deleteMemories:", v5);

}

+ (id)changeRequestForRemotelyViewedMemoryWithLocalIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setIncludePendingMemories:", 1);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("localIdentifier == %@"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 4, 0x7FFFFFFFFFFFFFFFLL, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PHMemoryChangeRequest changeRequestForMemory:](PHMemoryChangeRequest, "changeRequestForMemory:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "incrementViewCount");
    if (objc_msgSend(v7, "pendingState") == 1)
      objc_msgSend(v8, "setPendingState:", 0);
    PLSAggregateDictionaryAddValueForScalarKey();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
    objc_msgSend(v8, "clientName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D73C10]);

    +[PHMemory stringForCategory:](PHMemory, "stringForCategory:", objc_msgSend(v7, "category"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D73C18]);

    +[PHMemory stringForSubcategory:](PHMemory, "stringForSubcategory:", objc_msgSend(v7, "subcategory"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D73C20]);

    MEMORY[0x19AEBE464](*MEMORY[0x1E0D73C28], v9);
  }
  else
  {
    PLPhotoKitGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v3;
      _os_log_impl(&dword_1991EC000, v13, OS_LOG_TYPE_DEFAULT, "Cannot find memory for local identifier %@", buf, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

void __51__PHMemoryChangeRequest_validateMemoryTitle_error___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3780], "whitespaceAndNewlineCharacterSet");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeCharactersInString:", CFSTR(" "));
  v0 = objc_msgSend(v2, "copy");
  v1 = (void *)validateMemoryTitle_error__characterSet;
  validateMemoryTitle_error__characterSet = v0;

}

@end
