@implementation PHMomentShareChangeRequest

- (id)initForNewObject
{
  PHMomentShareChangeRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  PHShareRelationshipChangeRequestHelper *v5;
  PHShareRelationshipChangeRequestHelper *participantsHelper;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHMomentShareChangeRequest;
  v2 = -[PHChangeRequest init](&v8, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

    v5 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHShareRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("participants"), v2->super._helper);
    participantsHelper = v2->_participantsHelper;
    v2->_participantsHelper = v5;

  }
  return v2;
}

- (PHMomentShareChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHMomentShareChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  PHShareRelationshipChangeRequestHelper *v11;
  PHShareRelationshipChangeRequestHelper *participantsHelper;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHMomentShareChangeRequest;
  v8 = -[PHChangeRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

    v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHShareRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("participants"), v8->super._helper);
    participantsHelper = v8->_participantsHelper;
    v8->_participantsHelper = v11;

  }
  return v8;
}

- (PHMomentShareChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHMomentShareChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  void *v14;
  PHShareRelationshipChangeRequestHelper *v15;
  PHShareRelationshipChangeRequestHelper *participantsHelper;
  uint64_t v17;
  NSString *keySourceAssetIdentifier;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSSet *sourceAssetIdentifiersForBatchedCreation;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSSet *sourceAssetIdentifiersForCurationSet;
  uint64_t v33;
  NSDictionary *sourceAssetCMMAssetMapForCreationRequest;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  NSDictionary *sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  NSDictionary *sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation;
  NSObject *v53;
  void *v55;
  void *v56;
  id v57;
  id v58;
  objc_super v59;
  uint8_t buf[4];
  id v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v59.receiver = self;
  v59.super_class = (Class)PHMomentShareChangeRequest;
  v11 = -[PHChangeRequest init](&v59, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3B38], "currentConnection");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeWeak((id *)&v11->_clientConnection, v14);

      v15 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHShareRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("participants"), v8, v11->super._helper);
      participantsHelper = v11->_participantsHelper;
      v11->_participantsHelper = v15;

      v11->_changedAssets = xpc_dictionary_get_BOOL(v8, "changedAssetsKey");
      PLStringFromXPCDictionary();
      v17 = objc_claimAutoreleasedReturnValue();
      keySourceAssetIdentifier = v11->_keySourceAssetIdentifier;
      v11->_keySourceAssetIdentifier = (NSString *)v17;

      PLDataFromXPCDictionary();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)MEMORY[0x1E0D71800];
      v21 = (void *)MEMORY[0x1E0C99E60];
      v22 = objc_opt_class();
      objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = (void *)v19;
      objc_msgSend(v20, "secureUnarchivedObjectWithData:ofClasses:", v19, v23);
      v24 = objc_claimAutoreleasedReturnValue();
      sourceAssetIdentifiersForBatchedCreation = v11->_sourceAssetIdentifiersForBatchedCreation;
      v11->_sourceAssetIdentifiersForBatchedCreation = (NSSet *)v24;

      PLDataFromXPCDictionary();
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = (void *)MEMORY[0x1E0D71800];
      v28 = (void *)MEMORY[0x1E0C99E60];
      v29 = objc_opt_class();
      objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = (void *)v26;
      objc_msgSend(v27, "secureUnarchivedObjectWithData:ofClasses:", v26, v30);
      v31 = objc_claimAutoreleasedReturnValue();
      sourceAssetIdentifiersForCurationSet = v11->_sourceAssetIdentifiersForCurationSet;
      v11->_sourceAssetIdentifiersForCurationSet = (NSSet *)v31;

      PLDictionaryFromXPCDictionary();
      v33 = objc_claimAutoreleasedReturnValue();
      sourceAssetCMMAssetMapForCreationRequest = v11->_sourceAssetCMMAssetMapForCreationRequest;
      v11->_sourceAssetCMMAssetMapForCreationRequest = (NSDictionary *)v33;

      if (-[NSSet count](v11->_sourceAssetIdentifiersForBatchedCreation, "count")
        || -[NSSet count](v11->_sourceAssetIdentifiersForCurationSet, "count")
        || -[NSDictionary count](v11->_sourceAssetCMMAssetMapForCreationRequest, "count"))
      {
        -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
        objc_msgSend(v9, "recordUpdateRequest:", v11);
      }
      PLDataFromXPCDictionary();
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        v36 = (void *)MEMORY[0x1E0CB3710];
        v37 = (void *)MEMORY[0x1E0C99E60];
        v38 = objc_opt_class();
        v39 = objc_opt_class();
        objc_msgSend(v37, "setWithObjects:", v38, v39, objc_opt_class(), 0);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 0;
        objc_msgSend(v36, "unarchivedObjectOfClasses:fromData:error:", v40, v35, &v58);
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = v58;
        sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation = v11->_sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation;
        v11->_sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation = (NSDictionary *)v41;

      }
      else
      {
        PLBackendGetLog();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1991EC000, v42, OS_LOG_TYPE_ERROR, "sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryData is nil", buf, 2u);
        }
      }

      PLDataFromXPCDictionary();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {
        v45 = (void *)MEMORY[0x1E0CB3710];
        v46 = (void *)MEMORY[0x1E0C99E60];
        v47 = objc_opt_class();
        v48 = objc_opt_class();
        objc_msgSend(v46, "setWithObjects:", v47, v48, objc_opt_class(), 0);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = 0;
        objc_msgSend(v45, "unarchivedObjectOfClasses:fromData:error:", v49, v44, &v57);
        v50 = objc_claimAutoreleasedReturnValue();
        v51 = v57;
        sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation = v11->_sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation;
        v11->_sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation = (NSDictionary *)v50;

        if (v35)
        {
LABEL_19:

          goto LABEL_20;
        }
        PLBackendGetLog();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v61 = v51;
          _os_log_impl(&dword_1991EC000, v53, OS_LOG_TYPE_ERROR, "sourceAssetIdentifiersToMetadataCopyOptionsDictionary unarchiving error: %@", buf, 0xCu);
        }
      }
      else
      {
        PLBackendGetLog();
        v53 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1991EC000, v53, OS_LOG_TYPE_ERROR, "sourceAssetIdentifiersToMetadataCopyOptionsDictionary is nil", buf, 2u);
        }
        v51 = 0;
      }

      goto LABEL_19;
    }
  }
LABEL_20:

  return v11;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSSet *sourceAssetIdentifiersForBatchedCreation;
  void *v8;
  id v9;
  NSObject *v10;
  NSSet *sourceAssetIdentifiersForCurationSet;
  void *v12;
  id v13;
  NSObject *v14;
  NSDictionary *sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation;
  void *v16;
  id v17;
  NSObject *v18;
  NSDictionary *sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeToXPCDict:", v4);

  -[PHMomentShareChangeRequest participantsHelper](self, "participantsHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeToXPCDict:", v4);

  xpc_dictionary_set_BOOL(v4, "changedAssetsKey", self->_changedAssets);
  PLXPCDictionarySetString();
  sourceAssetIdentifiersForBatchedCreation = self->_sourceAssetIdentifiersForBatchedCreation;
  v26 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", sourceAssetIdentifiersForBatchedCreation, 1, &v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v26;
  if (v9)
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v9;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_ERROR, "sourceAssetIdentifiersForBatchedCreation archiving error: %@", buf, 0xCu);
    }

  }
  PLXPCDictionarySetData();

  sourceAssetIdentifiersForCurationSet = self->_sourceAssetIdentifiersForCurationSet;
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", sourceAssetIdentifiersForCurationSet, 1, &v25);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v25;
  if (v13)
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v13;
      _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "sourceAssetIdentifiersForCurationSet archiving error: %@", buf, 0xCu);
    }

  }
  PLXPCDictionarySetData();
  PLXPCDictionarySetDictionary();

  sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation = self->_sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation, 1, &v24);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v24;
  if (v17)
  {
    PLBackendGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v17;
      _os_log_impl(&dword_1991EC000, v18, OS_LOG_TYPE_DEFAULT, "sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionary archiving error: %@", buf, 0xCu);
    }

  }
  PLXPCDictionarySetData();

  sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation = self->_sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation;
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation, 1, &v23);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v23;
  if (v21)
  {
    PLBackendGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v21;
      _os_log_impl(&dword_1991EC000, v22, OS_LOG_TYPE_DEFAULT, "sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionary archiving error: %@", buf, 0xCu);
    }

  }
  PLXPCDictionarySetData();

}

- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4
{
  int v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "type");
  v6 = v5;
  if (a4 && v5 != 1)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = CFSTR("Change must be performed within the sharedMomentSharePhotoLibrary");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6 == 1;
}

- (NSString)managedEntityName
{
  return (NSString *)CFSTR("MomentShare");
}

- (PHObjectPlaceholder)placeholderForCreatedMomentShare
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHObjectPlaceholder *)v4;
}

- (NSString)originatingScopeIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("originatingScopeIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setOriginatingScopeIdentifier:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("originatingScopeIdentifier"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("originatingScopeIdentifier"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("originatingScopeIdentifier"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("originatingScopeIdentifier"));
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

- (id)thumbnailImageData
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("thumbnailImageData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setThumbnailImageData:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("thumbnailImageData"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("thumbnailImageData"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("thumbnailImageData"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("thumbnailImageData"));
  }

}

- (NSData)previewData
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("previewData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v5;
}

- (void)setPreviewData:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("previewData"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("previewData"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("previewData"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("previewData"));
  }

}

- (BOOL)shouldIgnoreBudgets
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("shouldIgnoreBudgets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setShouldIgnoreBudgets:(BOOL)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("shouldIgnoreBudgets"));

}

- (BOOL)shouldNotifyOnUploadCompletion
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("shouldNotifyOnUploadCompletion"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setShouldNotifyOnUploadCompletion:(BOOL)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("shouldNotifyOnUploadCompletion"));

}

- (signed)mode
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("publicPermission"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (__int16)v3;
}

- (void)setPublicPermission:(signed __int16)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("publicPermission"));

}

- (void)_setOriginalMomentShare:(id)a3
{
  objc_storeStrong((id *)&self->_originalMomentShare, a3);
}

- (void)addParticipants:(id)a3
{
  -[PHShareRelationshipChangeRequestHelper addParticipants:toChangeRequest:](self->_participantsHelper, "addParticipants:toChangeRequest:", a3, self);
}

- (void)createMomentShareAssetsFromAssets:(id)a3 withCreationOptionsPerAsset:(id)a4 withPreview:(id)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  PHAssetCreationOptions *v13;
  void *v14;
  void *v15;
  id v16;
  PHAssetCreationOptions *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  NSSet *sourceAssetIdentifiersForBatchedCreation;
  uint64_t v29;
  NSDictionary *sourceAssetCMMAssetMapForCreationRequest;
  uint64_t v31;
  NSDictionary *sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation;
  uint64_t v33;
  NSDictionary *sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation;
  void *v35;
  void *v36;
  uint64_t v37;
  NSSet *sourceAssetIdentifiersForCurationSet;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  uint64_t v47;
  NSString *keySourceAssetIdentifier;
  void *v49;
  void *v50;
  void *v51;
  SEL v52;
  PHMomentShareChangeRequest *v53;
  PHMomentShare *v54;
  void *v55;
  void *v56;
  id v57;
  id obj;
  uint64_t v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[5];
  id v69;
  PHAssetCreationOptions *v70;
  id v71;
  id v72;
  id v73;
  uint64_t *v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  char v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;
  NSRect v86;

  v52 = a2;
  v85 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v60 = a4;
  v57 = a5;
  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v53 = self;
  if (-[PHChangeRequest isNewRequest](self, "isNewRequest"))
  {
    -[PHMomentShareChangeRequest placeholderForCreatedMomentShare](self, "placeholderForCreatedMomentShare");
    v54 = (PHMomentShare *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v54 = self->_originalMomentShare;
  }
  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v8;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
  if (v9)
  {
    v55 = 0;
    v59 = *(_QWORD *)v80;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v80 != v59)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v10);
        if ((objc_msgSend(v11, "isPhotoStreamPhoto", v52) & 1) != 0
          || objc_msgSend(v11, "isCloudSharedAsset"))
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", v52, v53, CFSTR("PHMomentShareChangeRequest.m"), 296, CFSTR("MomentShare assets must not be cloud shared or photo stream assets"));

        }
        objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "objectForKeyedSubscript:", v12);
        v13 = (PHAssetCreationOptions *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          v13 = objc_alloc_init(PHAssetCreationOptions);
        v75 = 0;
        v76 = &v75;
        v77 = 0x2020000000;
        v78 = 0;
        objc_msgSend(v11, "photoLibrary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "photoLibrary");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = __104__PHMomentShareChangeRequest_createMomentShareAssetsFromAssets_withCreationOptionsPerAsset_withPreview___block_invoke;
        v68[3] = &unk_1E35DF978;
        v68[4] = v11;
        v16 = v15;
        v69 = v16;
        v74 = &v75;
        v17 = v13;
        v70 = v17;
        v71 = v63;
        v72 = v62;
        v73 = v61;
        objc_msgSend(v16, "performBlockAndWait:", v68);
        if (!*((_BYTE *)v76 + 24))
        {
          -[PHAssetCreationOptions setShouldDownloadOrCloudReReferenceMissingResources:](v17, "setShouldDownloadOrCloudReReferenceMissingResources:", 1);
          -[PHAssetCreationOptions setResetUserSpecificMetadata:](v17, "setResetUserSpecificMetadata:", 1);
          +[PHAssetCreationRequest creationRequestForAssetCopyFromAsset:options:](PHAssetCreationRequest, "creationRequestForAssetCopyFromAsset:options:", v11, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setMomentShare:", v54);
          objc_msgSend(v18, "placeholderForCreatedAsset");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "uuid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v57, "keyAsset");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v11, "isEqual:", v21);

          if (v22)
          {
            v23 = v20;

            v55 = v23;
          }
          objc_msgSend(v11, "uuid");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKey:", v20, v24);

        }
        _Block_object_dispose(&v75, 8);

        ++v10;
      }
      while (v9 != v10);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
      v9 = v26;
    }
    while (v26);
  }
  else
  {
    v55 = 0;
  }

  v27 = objc_msgSend(v63, "copy");
  sourceAssetIdentifiersForBatchedCreation = v53->_sourceAssetIdentifiersForBatchedCreation;
  v53->_sourceAssetIdentifiersForBatchedCreation = (NSSet *)v27;

  v29 = objc_msgSend(v56, "copy");
  sourceAssetCMMAssetMapForCreationRequest = v53->_sourceAssetCMMAssetMapForCreationRequest;
  v53->_sourceAssetCMMAssetMapForCreationRequest = (NSDictionary *)v29;

  v31 = objc_msgSend(v62, "copy");
  sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation = v53->_sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation;
  v53->_sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation = (NSDictionary *)v31;

  v33 = objc_msgSend(v61, "copy");
  sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation = v53->_sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation;
  v53->_sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation = (NSDictionary *)v33;

  v35 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v57, "curatedAssetIdentifiers");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setWithArray:", v36);
  v37 = objc_claimAutoreleasedReturnValue();
  sourceAssetIdentifiersForCurationSet = v53->_sourceAssetIdentifiersForCurationSet;
  v53->_sourceAssetIdentifiersForCurationSet = (NSSet *)v37;

  if (v57)
  {
    objc_msgSend(v57, "thumbnailImageData");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHMomentShareChangeRequest setThumbnailImageData:](v53, "setThumbnailImageData:", v39);

    v40 = objc_alloc_init(MEMORY[0x1E0D113E0]);
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v57, "previewImageData");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
    if (v42)
    {
      v43 = *(_QWORD *)v65;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v65 != v43)
            objc_enumerationMutation(v41);
          objc_msgSend(v40, "addPreviewImageData:", *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i), v52);
        }
        v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v83, 16);
      }
      while (v42);
    }

    objc_msgSend(v57, "keyAsset");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (v45)
    {
      if (v55)
        objc_msgSend(v40, "setKeyAssetIdentifier:", v55);
      objc_msgSend(v57, "keyAsset", v52);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "uuid");
      v47 = objc_claimAutoreleasedReturnValue();
      keySourceAssetIdentifier = v53->_keySourceAssetIdentifier;
      v53->_keySourceAssetIdentifier = (NSString *)v47;

      objc_msgSend(v57, "cropRect");
      NSStringFromRect(v86);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setCropRectString:", v49);
      objc_msgSend(v40, "data");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHMomentShareChangeRequest setPreviewData:](v53, "setPreviewData:", v50);

    }
  }
  v53->_changedAssets = 1;
  -[PHChangeRequest helper](v53, "helper", v52);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "didMutate");

}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  id v13;

  v6 = a3;
  -[PHMomentShareChangeRequest creationDate](self, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  objc_msgSend((id)objc_opt_class(), "validateMomentShareCreationDate:error:", v7, &v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v13;

  if (v8)
  {
    if ((objc_msgSend(v6, "isCloudPhotoLibraryEnabled") & 1) != 0)
    {
      v10 = 1;
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3300, CFSTR("iCloud Photo Library is not enabled. iCPL must be enabled to create moment shares"));
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  if (a4)
  {
    v9 = objc_retainAutorelease(v9);
    v10 = 0;
    *a4 = v9;
  }
  else
  {
    v10 = 0;
  }
LABEL_8:

  return v10;
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = (void *)MEMORY[0x1E0D718F0];
  v7 = a3;
  -[PHChangeRequest uuid](self, "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMomentShareChangeRequest creationDate](self, "creationDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHMomentShareChangeRequest title](self, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createOwnedShareWithUUID:creationDate:title:inPhotoLibrary:", v8, v9, v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v11;
}

- (BOOL)_addSourceAssetsToMomentShare:(id)a3 error:(id *)a4
{
  objc_class *v5;
  void *v6;
  void *v7;
  NSSet *sourceAssetIdentifiersForBatchedCreation;
  id v9;
  id v10;
  NSSet *v11;
  NSDictionary *sourceAssetCMMAssetMapForCreationRequest;
  void *v13;
  NSSet *sourceAssetIdentifiersForCurationSet;
  NSString *keySourceAssetIdentifier;
  id WeakRetained;
  void *v17;
  char v18;
  id v19;
  id v21;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v21 = a3;
  v6 = (void *)objc_msgSend([v5 alloc], "initWithCapacity:", -[NSSet count](self->_sourceAssetIdentifiersForBatchedCreation, "count"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSSet count](self->_sourceAssetIdentifiersForBatchedCreation, "count"));
  sourceAssetIdentifiersForBatchedCreation = self->_sourceAssetIdentifiersForBatchedCreation;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __66__PHMomentShareChangeRequest__addSourceAssetsToMomentShare_error___block_invoke;
  v24[3] = &unk_1E35DC438;
  v24[4] = self;
  v9 = v6;
  v25 = v9;
  v10 = v7;
  v26 = v10;
  -[NSSet enumerateObjectsUsingBlock:](sourceAssetIdentifiersForBatchedCreation, "enumerateObjectsUsingBlock:", v24);
  v11 = self->_sourceAssetIdentifiersForBatchedCreation;
  sourceAssetCMMAssetMapForCreationRequest = self->_sourceAssetCMMAssetMapForCreationRequest;
  v13 = (void *)MEMORY[0x1E0D71880];
  sourceAssetIdentifiersForCurationSet = self->_sourceAssetIdentifiersForCurationSet;
  keySourceAssetIdentifier = self->_keySourceAssetIdentifier;
  WeakRetained = objc_loadWeakRetained((id *)&self->_clientConnection);
  objc_msgSend(v21, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v18 = objc_msgSend(v13, "createMomentShareAssetsForMomentShare:batchedSourceAssetsToCopy:creationRequestSourceAssetsCMMAssetsMap:curatedSourceAssets:adjustmentBakeInOptionsDictionary:metadataCopyOptionsDictionary:keySourceAssetIdentifier:clientConnection:library:error:", v21, v11, sourceAssetCMMAssetMapForCreationRequest, sourceAssetIdentifiersForCurationSet, v9, v10, keySourceAssetIdentifier, WeakRetained, v17, &v23);

  v19 = v23;
  if (a4 && (v18 & 1) == 0)
    *a4 = objc_retainAutorelease(v19);

  return v18;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[8];

  v23[7] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  -[PHChangeRequest helper](self, "helper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v11 = objc_msgSend(v10, "allowMutationToManagedObject:propertyKey:error:", v9, v8, &v20);

  v12 = v20;
  if (!v11)
  {
    v14 = 0;
    if (!a5)
      goto LABEL_11;
    goto LABEL_9;
  }
  v23[0] = CFSTR("title");
  v23[1] = CFSTR("publicPermission");
  v23[2] = CFSTR("momentShareAssets");
  v23[3] = CFSTR("creationDate");
  v23[4] = CFSTR("participants");
  v23[5] = CFSTR("shouldIgnoreBudgets");
  v23[6] = CFSTR("shouldNotifyOnUploadCompletion");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PHChangeRequest isNewRequest](self, "isNewRequest") || (objc_msgSend(v13, "containsObject:", v8) & 1) != 0)
  {
    v14 = 1;
  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid operation on key %@"), v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v12 = (id)v18;
  }

  if (a5)
  {
LABEL_9:
    if (!v14)
      *a5 = objc_retainAutorelease(v12);
  }
LABEL_11:

  return v14;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  int v9;
  id v10;
  PHShareRelationshipChangeRequestHelper *participantsHelper;
  _BOOL4 v12;
  id v13;
  BOOL v14;
  id v16;
  id v17;
  id v18;

  v7 = a3;
  -[PHChangeRequest helper](self, "helper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v9 = objc_msgSend(v8, "applyMutationsToManagedObject:error:", v7, &v18);
  v10 = v18;

  if (v9)
  {
    participantsHelper = self->_participantsHelper;
    v17 = v10;
    v12 = -[PHShareRelationshipChangeRequestHelper applyMutationsToManagedObject:error:](participantsHelper, "applyMutationsToManagedObject:error:", v7, &v17);
    v13 = v17;

    if (v12)
    {
      if (!self->_changedAssets)
      {
        v14 = 1;
        goto LABEL_12;
      }
      v16 = v13;
      v14 = -[PHMomentShareChangeRequest _addSourceAssetsToMomentShare:error:](self, "_addSourceAssetsToMomentShare:error:", v7, &v16);
      v10 = v16;

      if (!a5)
        goto LABEL_11;
    }
    else
    {
      v14 = 0;
      v10 = v13;
      if (!a5)
      {
LABEL_11:
        v13 = v10;
        goto LABEL_12;
      }
    }
  }
  else
  {
    v14 = 0;
    if (!a5)
      goto LABEL_11;
  }
  if (v14)
    goto LABEL_11;
  v13 = objc_retainAutorelease(v10);
  v14 = 0;
  *a5 = v13;
LABEL_12:

  return v14;
}

- (PHShareRelationshipChangeRequestHelper)participantsHelper
{
  return self->_participantsHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_participantsHelper, 0);
  objc_storeStrong((id *)&self->_sourceAssetIdentifiersToMetadataCopyOptionsDictionaryForBatchedCreation, 0);
  objc_storeStrong((id *)&self->_sourceAssetIdentifiersToAdjustmentBakeInOptionsDictionaryForBatchedCreation, 0);
  objc_storeStrong((id *)&self->_sourceAssetCMMAssetMapForCreationRequest, 0);
  objc_storeStrong((id *)&self->_sourceAssetIdentifiersForCurationSet, 0);
  objc_storeStrong((id *)&self->_sourceAssetIdentifiersForBatchedCreation, 0);
  objc_storeStrong((id *)&self->_keySourceAssetIdentifier, 0);
  objc_destroyWeak((id *)&self->_clientConnection);
  objc_storeStrong((id *)&self->_originalMomentShare, 0);
}

void __66__PHMomentShareChangeRequest__addSourceAssetsToMomentShare_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  PHAssetCreationAdjustmentBakeInOptions *v4;
  PHAssetCreationAdjustmentBakeInOptions *v5;
  void *v6;
  void *v7;
  PHAssetCreationMetadataCopyOptions *v8;
  PHAssetCreationMetadataCopyOptions *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "objectForKeyedSubscript:", v11);
    v4 = (PHAssetCreationAdjustmentBakeInOptions *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(PHAssetCreationAdjustmentBakeInOptions);
  }
  v5 = v4;
  -[PHAssetCreationAdjustmentBakeInOptions plRepresentation](v4, "plRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v6, v11);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "objectForKeyedSubscript:", v11);
    v8 = (PHAssetCreationMetadataCopyOptions *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_alloc_init(PHAssetCreationMetadataCopyOptions);
  }
  v9 = v8;
  -[PHAssetCreationMetadataCopyOptions plRepresentation](v8, "plRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v10, v11);

}

void __104__PHMomentShareChangeRequest_createMomentShareAssetsFromAssets_withCreationOptionsPerAsset_withPreview___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v2 = (void *)MEMORY[0x1E0D71880];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetWithObjectID:inLibrary:", v3, *(_QWORD *)(a1 + 40));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(MEMORY[0x1E0D71880], "shouldPerformServerCopyWithSourceAsset:copyingFromMomentShare:photoLibrary:", v15, 0, *(_QWORD *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 80);
  if (*(_BYTE *)(*(_QWORD *)(v4 + 8) + 24))
  {
    objc_msgSend(*(id *)(a1 + 48), "metadataCopyOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldCopyLocationData");

    v4 = *(_QWORD *)(a1 + 80);
    if ((v6 & 1) == 0)
    {
      *(_BYTE *)(*(_QWORD *)(v4 + 8) + 24) = 0;
      v4 = *(_QWORD *)(a1 + 80);
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(v4 + 8) + 24))
  {
    v7 = *(void **)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v8);

    objc_msgSend(*(id *)(a1 + 48), "adjustmentBakeInOptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

    objc_msgSend(*(id *)(a1 + 48), "metadataCopyOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 72);
    objc_msgSend(*(id *)(a1 + 32), "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

  }
}

+ (id)changeRequestForMomentShare:(id)a3
{
  id v3;
  PHMomentShareChangeRequest *v4;
  void *v5;
  void *v6;
  PHMomentShareChangeRequest *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = [PHMomentShareChangeRequest alloc];
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PHMomentShareChangeRequest initWithUUID:objectID:](v4, "initWithUUID:objectID:", v5, v6);

    -[PHMomentShareChangeRequest _setOriginalMomentShare:](v7, "_setOriginalMomentShare:", v3);
    -[PHMomentShareChangeRequest participantsHelper](v7, "participantsHelper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOriginalShare:", v3);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)creationRequestForMomentShareWithTitle:(id)a3 publicPermission:(signed __int16)a4 creationDate:(id)a5 createMomentShareAssetsFromAssets:(id)a6 creationOptionsPerAsset:(id)a7 preview:(id)a8 originatingMomentShare:(id)a9
{
  uint64_t v12;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v25;

  v12 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a5;
  v21 = a3;
  if (!objc_msgSend(v16, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHMomentShareChangeRequest.m"), 202, CFSTR("assets must not be empty"));

  }
  v22 = -[PHMomentShareChangeRequest initForNewObject]([PHMomentShareChangeRequest alloc], "initForNewObject");
  objc_msgSend(v22, "setTitle:", v21);

  objc_msgSend(v22, "setPublicPermission:", v12);
  objc_msgSend(v22, "setCreationDate:", v20);

  if (v19)
  {
    objc_msgSend(v19, "scopeIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
      objc_msgSend(v22, "setOriginatingScopeIdentifier:", v23);

  }
  objc_msgSend(v22, "createMomentShareAssetsFromAssets:withCreationOptionsPerAsset:withPreview:", v16, v17, v18);

  return v22;
}

+ (id)validateMomentShareCreationDate:(id)a3 error:(id *)a4
{
  id v5;
  id v6;

  v5 = a3;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3300, CFSTR("Nil creation date not supported"));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
      v6 = objc_retainAutorelease(v6);
      *a4 = v6;
    }
  }

  return v5;
}

+ (void)trashMomentShares:(id)a3
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
          objc_msgSend(v19, "stringWithFormat:", CFSTR("Invalid object %@ passed to %@, objects must be of type PHMomentShare"), v10, v20);
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
        +[PHObjectDeleteRequest deleteRequestForObject:](PHMomentShareDeleteRequest, "deleteRequestForObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setOperation:", 0);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v13);
  }

}

+ (void)expungeMomentShares:(id)a3
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
          objc_msgSend(v19, "stringWithFormat:", CFSTR("Invalid object %@ passed to %@, objects must be of type PHMomentShare"), v10, v20);
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
        +[PHObjectDeleteRequest deleteRequestForObject:](PHMomentShareDeleteRequest, "deleteRequestForObject:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setOperation:", 1);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v13);
  }

}

@end
