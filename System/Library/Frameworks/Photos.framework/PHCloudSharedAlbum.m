@implementation PHCloudSharedAlbum

- (Class)changeRequestClass
{
  return (Class)objc_opt_class();
}

- (PHCloudSharedAlbum)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHCloudSharedAlbum *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSString *cloudOwnerFirstName;
  uint64_t v16;
  NSString *cloudOwnerLastName;
  uint64_t v18;
  NSString *cloudOwnerFullName;
  uint64_t v20;
  NSNumber *cloudOwnerEmailKey;
  uint64_t v22;
  NSString *cloudOwnerHashedPersonID;
  uint64_t v24;
  NSString *publicURL;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *cloudOwnerPersonID;
  uint64_t v30;
  NSNumber *cloudRelationshipState;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  objc_super v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  int v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v37.receiver = self;
  v37.super_class = (Class)PHCloudSharedAlbum;
  v9 = -[PHAssetCollection initWithFetchDictionary:propertyHint:photoLibrary:](&v37, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudMultipleContributorsEnabled"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_cloudMultipleContributorsEnabled = objc_msgSend(v10, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isOwned"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_owned = objc_msgSend(v11, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudNotificationsEnabled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_cloudNotificationsEnabled = objc_msgSend(v12, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudAlbumSubtype"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_cloudAlbumSubtype = objc_msgSend(v13, "shortValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudOwnerFirstName"));
    v14 = objc_claimAutoreleasedReturnValue();
    cloudOwnerFirstName = v9->_cloudOwnerFirstName;
    v9->_cloudOwnerFirstName = (NSString *)v14;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudOwnerLastName"));
    v16 = objc_claimAutoreleasedReturnValue();
    cloudOwnerLastName = v9->_cloudOwnerLastName;
    v9->_cloudOwnerLastName = (NSString *)v16;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudOwnerFullName"));
    v18 = objc_claimAutoreleasedReturnValue();
    cloudOwnerFullName = v9->_cloudOwnerFullName;
    v9->_cloudOwnerFullName = (NSString *)v18;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudOwnerEmailKey"));
    v20 = objc_claimAutoreleasedReturnValue();
    cloudOwnerEmailKey = v9->_cloudOwnerEmailKey;
    v9->_cloudOwnerEmailKey = (NSNumber *)v20;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudOwnerHashedPersonID"));
    v22 = objc_claimAutoreleasedReturnValue();
    cloudOwnerHashedPersonID = v9->_cloudOwnerHashedPersonID;
    v9->_cloudOwnerHashedPersonID = (NSString *)v22;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("publicURL"));
    v24 = objc_claimAutoreleasedReturnValue();
    publicURL = v9->_publicURL;
    v9->_publicURL = (NSString *)v24;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudPublicURLEnabled"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "BOOLValue") & 1) != 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudPublicURLEnabledLocal"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v9->_publicURLEnabled = objc_msgSend(v27, "BOOLValue");

    }
    else
    {
      v9->_publicURLEnabled = 0;
    }

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudPersonID"));
    v28 = objc_claimAutoreleasedReturnValue();
    cloudOwnerPersonID = v9->_cloudOwnerPersonID;
    v9->_cloudOwnerPersonID = (NSString *)v28;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudRelationshipState"));
    v30 = objc_claimAutoreleasedReturnValue();
    cloudRelationshipState = v9->_cloudRelationshipState;
    v9->_cloudRelationshipState = (NSNumber *)v30;

    if (!-[PHAssetCollection assetCollectionType](v9, "assetCollectionType")
      || !-[PHAssetCollection assetCollectionSubtype](v9, "assetCollectionSubtype"))
    {
      PLPhotoKitGetLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
      {
        v33 = -[PHAssetCollection assetCollectionType](v9, "assetCollectionType");
        v34 = -[PHAssetCollection assetCollectionSubtype](v9, "assetCollectionSubtype");
        v35 = -[PHAssetCollection plAlbumKind](v9, "plAlbumKind");
        *(_DWORD *)buf = 134218754;
        v39 = v33;
        v40 = 2048;
        v41 = v34;
        v42 = 1024;
        v43 = v35;
        v44 = 2112;
        v45 = v8;
        _os_log_impl(&dword_1991EC000, v32, OS_LOG_TYPE_FAULT, "PHCloudSharedAlbum: rdar://problem/18103586 Invalid asset collection type (%lu) or subtype (%lu) with album kind: %d, dict: %@", buf, 0x26u);
      }

    }
  }

  return v9;
}

- (BOOL)isCloudSharedAlbum
{
  return 1;
}

- (id)localizedSharedByLabelAllowsEmail:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  -[PHCloudSharedAlbum cloudOwnerFirstName](self, "cloudOwnerFirstName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCloudSharedAlbum cloudOwnerLastName](self, "cloudOwnerLastName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCloudSharedAlbum cloudOwnerFullName](self, "cloudOwnerFullName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCloudSharedAlbum cloudOwnerEmailKey](self, "cloudOwnerEmailKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0D71628];
  v10 = -[PHCloudSharedAlbum isOwned](self, "isOwned");
  -[PHObject photoLibrary](self, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photoLibraryBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "emailAddressManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedSharedByLabelWithFirstName:lastName:fullName:emailKey:isOwned:allowsEmail:emailAddressManager:", v5, v6, v7, v8, v10, v3, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)collectionHasFixedOrder
{
  return 1;
}

- (NSString)cloudOwnerEmail
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PHObject photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibraryBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "emailAddressManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHCloudSharedAlbum cloudOwnerEmailKey](self, "cloudOwnerEmailKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emailAddressForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v3, "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "personInfoManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHCloudSharedAlbum cloudOwnerHashedPersonID](self, "cloudOwnerHashedPersonID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "emailForPersonID:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      if ((PLIsAssetsd() & 1) == 0)
        objc_msgSend(MEMORY[0x1E0D71BA8], "checkedSharedAlbumServerModelRelationships");
      v7 = 0;
    }
  }

  return (NSString *)v7;
}

- (NSString)cloudOwnerPhone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PHObject photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personInfoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phonesForInvitationRecordGUID:", self->_cloudOwnerPersonID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSArray)invitationRecords
{
  void *v2;
  void *v3;

  +[PHCloudSharedAlbumInvitationRecord fetchInvitationRecordsForSharedAlbum:](PHCloudSharedAlbumInvitationRecord, "fetchInvitationRecordsForSharedAlbum:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchedObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (BOOL)canPerformEditOperation:(int64_t)a3
{
  int v6;
  int cloudAlbumSubtype;
  _BOOL4 v8;
  BOOL v9;
  void *v12;
  void *v13;

  v6 = objc_msgSend(MEMORY[0x1E0D732D8], "isEntitledForPhotoKit");
  if (v6)
  {
    if (-[PHCollection isDeleted](self, "isDeleted"))
    {
LABEL_3:
      LOBYTE(v6) = 0;
      return v6;
    }
    if (-[PHAssetCollection assetCollectionType](self, "assetCollectionType") != PHAssetCollectionTypeAlbum)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHCloudSharedAlbum.m"), 228, CFSTR("Wrong type %lu"), -[PHAssetCollection assetCollectionType](self, "assetCollectionType"));

    }
    if (-[PHAssetCollection assetCollectionSubtype](self, "assetCollectionSubtype") != PHAssetCollectionSubtypeAlbumCloudShared)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHCloudSharedAlbum.m"), 229, CFSTR("Wrong subtype %lu"), -[PHAssetCollection assetCollectionSubtype](self, "assetCollectionSubtype"));

    }
    cloudAlbumSubtype = (unsigned __int16)self->_cloudAlbumSubtype;
    v8 = -[PHCloudSharedAlbum isOwned](self, "isOwned");
    if (cloudAlbumSubtype == 1)
    {
      v9 = a3 == 6 && v8;
      LOBYTE(v6) = (a3 & 0xFFFFFFFFFFFFFFFDLL) == 1 || v9;
    }
    else if (v8)
    {
      LOBYTE(v6) = a3 != 5 && a3 != 2;
    }
    else
    {
      if (-[PHCloudSharedAlbum isCloudMultipleContributorsEnabled](self, "isCloudMultipleContributorsEnabled"))
      {
        if ((unint64_t)a3 < 7)
          return (0x4Au >> a3) & 1;
        goto LABEL_3;
      }
      LOBYTE(v6) = a3 == 6 || a3 == 1;
    }
  }
  return v6;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHCloudSharedAlbum;
  -[PHAssetCollection description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isOwned
{
  return self->_owned;
}

- (BOOL)isCloudMultipleContributorsEnabled
{
  return self->_cloudMultipleContributorsEnabled;
}

- (BOOL)isCloudNotificationsEnabled
{
  return self->_cloudNotificationsEnabled;
}

- (signed)cloudAlbumSubtype
{
  return self->_cloudAlbumSubtype;
}

- (NSString)cloudOwnerFirstName
{
  return self->_cloudOwnerFirstName;
}

- (NSString)cloudOwnerLastName
{
  return self->_cloudOwnerLastName;
}

- (NSString)cloudOwnerFullName
{
  return self->_cloudOwnerFullName;
}

- (NSNumber)cloudOwnerEmailKey
{
  return self->_cloudOwnerEmailKey;
}

- (NSString)cloudOwnerHashedPersonID
{
  return self->_cloudOwnerHashedPersonID;
}

- (NSString)publicURL
{
  return self->_publicURL;
}

- (BOOL)publicURLEnabled
{
  return self->_publicURLEnabled;
}

- (NSString)cloudOwnerPersonID
{
  return self->_cloudOwnerPersonID;
}

- (NSNumber)cloudRelationshipState
{
  return self->_cloudRelationshipState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudRelationshipState, 0);
  objc_storeStrong((id *)&self->_cloudOwnerPersonID, 0);
  objc_storeStrong((id *)&self->_publicURL, 0);
  objc_storeStrong((id *)&self->_cloudOwnerHashedPersonID, 0);
  objc_storeStrong((id *)&self->_cloudOwnerEmailKey, 0);
  objc_storeStrong((id *)&self->_cloudOwnerFullName, 0);
  objc_storeStrong((id *)&self->_cloudOwnerLastName, 0);
  objc_storeStrong((id *)&self->_cloudOwnerFirstName, 0);
}

+ (id)fetchCloudSharedAlbumsWithGUIDs:(id)a3 options:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a4;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("cloudGUID"), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);

  +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 1, 101, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)fetchCloudSharedAlbumsWithOptions:(id)a3
{
  return +[PHAssetCollection fetchAssetCollectionsWithType:subtype:options:](PHAssetCollection, "fetchAssetCollectionsWithType:subtype:options:", 1, 101, a3);
}

+ (id)fetchCloudSharedAlbumsWithLocalIdentifiers:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__PHCloudSharedAlbum_fetchCloudSharedAlbumsWithLocalIdentifiers_options___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v5;
  v6 = v5;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a4, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__PHCloudSharedAlbum_propertiesToFetchWithHint___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (propertiesToFetchWithHint__onceToken_42169 != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken_42169, block);
  return (id)propertiesToFetchWithHint__array_42170;
}

+ (id)managedEntityName
{
  return CFSTR("CloudSharedAlbum");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHCloudSharedAlbum");
  return CFSTR("PHCloudSharedAlbum");
}

+ (id)identifierCode
{
  return CFSTR("040");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15_42150;
}

+ (id)transformValueExpression:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PHCloudSharedAlbum_transformValueExpression_forKeyPath___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (transformValueExpression_forKeyPath__onceToken_42133 != -1)
    dispatch_once(&transformValueExpression_forKeyPath__onceToken_42133, block);
  if (objc_msgSend((id)transformValueExpression_forKeyPath___passThroughSet_42134, "containsObject:", v7))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

void __58__PHCloudSharedAlbum_transformValueExpression_forKeyPath___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[11];

  v4[10] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("localizedTitle");
  v4[1] = CFSTR("title");
  v4[2] = CFSTR("estimatedAssetCount");
  v4[3] = CFSTR("startDate");
  v4[4] = CFSTR("endDate");
  v4[5] = CFSTR("cloudGUID");
  v4[6] = CFSTR("cloudMultipleContributorsEnabled");
  v4[7] = CFSTR("isOwned");
  v4[8] = CFSTR("cloudAlbumSubtype");
  v4[9] = CFSTR("cloudRelationshipState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 10);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)transformValueExpression_forKeyPath___passThroughSet_42134;
  transformValueExpression_forKeyPath___passThroughSet_42134 = v2;

}

void __34__PHCloudSharedAlbum_entityKeyMap__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PHEntityKeyMap *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  const __CFString *v27;
  const __CFString *v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  _QWORD v42[2];
  const __CFString *v43;
  _QWORD v44[20];
  _QWORD v45[22];

  v45[20] = *MEMORY[0x1E0C80C00];
  v18 = [PHEntityKeyMap alloc];
  v43 = CFSTR("uuid");
  v44[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v23;
  v44[1] = CFSTR("title");
  v42[0] = CFSTR("localizedTitle");
  v42[1] = CFSTR("title");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v22;
  v44[2] = CFSTR("cachedCount");
  v41 = CFSTR("estimatedAssetCount");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v21;
  v44[3] = CFSTR("customSortAscending");
  v40 = CFSTR("customSortAscending");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v45[3] = v20;
  v44[4] = CFSTR("customSortKey");
  v39 = CFSTR("customSortKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45[4] = v19;
  v44[5] = CFSTR("startDate");
  v38 = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v17;
  v44[6] = CFSTR("endDate");
  v37 = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v16;
  v44[7] = CFSTR("cloudGUID");
  v36 = CFSTR("cloudGUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[7] = v15;
  v44[8] = CFSTR("privacyState");
  v35 = CFSTR("privacyState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[8] = v14;
  v44[9] = CFSTR("cloudMultipleContributorsEnabled");
  v34 = CFSTR("cloudMultipleContributorsEnabled");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45[9] = v13;
  v44[10] = CFSTR("isOwned");
  v33 = CFSTR("isOwned");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[10] = v12;
  v44[11] = CFSTR("cloudNotificationsEnabled");
  v32 = CFSTR("cloudNotificationsEnabled");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v45[11] = v0;
  v44[12] = CFSTR("cloudAlbumSubtype");
  v31 = CFSTR("cloudAlbumSubtype");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v45[12] = v1;
  v44[13] = CFSTR("cloudOwnerEmailKey");
  v30 = CFSTR("cloudOwnerEmailKey");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v45[13] = v2;
  v44[14] = CFSTR("cloudOwnerFirstName");
  v29 = CFSTR("cloudOwnerFirstName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v45[14] = v3;
  v44[15] = CFSTR("cloudOwnerFullName");
  v28 = CFSTR("cloudOwnerFullName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v45[15] = v4;
  v44[16] = CFSTR("cloudOwnerLastName");
  v27 = CFSTR("cloudOwnerLastName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v45[16] = v5;
  v44[17] = CFSTR("cloudOwnerHashedPersonID");
  v26 = CFSTR("cloudOwnerHashedPersonID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v45[17] = v6;
  v44[18] = CFSTR("cloudPersonID");
  v25 = CFSTR("cloudOwnerPersonID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45[18] = v7;
  v44[19] = CFSTR("cloudRelationshipState");
  v24 = CFSTR("cloudRelationshipState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45[19] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v18, "initWithPropertyKeysByEntityKey:", v9);
  v11 = (void *)entityKeyMap_pl_once_object_15_42150;
  entityKeyMap_pl_once_object_15_42150 = v10;

}

void __48__PHCloudSharedAlbum_propertiesToFetchWithHint___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[15];

  v5[14] = *MEMORY[0x1E0C80C00];
  +[PHAssetCollection propertiesToFetchWithHint:](PHAssetCollection, "propertiesToFetchWithHint:", *(_QWORD *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = CFSTR("cloudMultipleContributorsEnabled");
  v5[1] = CFSTR("isOwned");
  v5[2] = CFSTR("cloudNotificationsEnabled");
  v5[3] = CFSTR("cloudAlbumSubtype");
  v5[4] = CFSTR("cloudOwnerEmailKey");
  v5[5] = CFSTR("cloudOwnerFirstName");
  v5[6] = CFSTR("cloudOwnerFullName");
  v5[7] = CFSTR("cloudOwnerLastName");
  v5[8] = CFSTR("cloudOwnerHashedPersonID");
  v5[9] = CFSTR("publicURL");
  v5[10] = CFSTR("cloudPublicURLEnabled");
  v5[11] = CFSTR("cloudPublicURLEnabledLocal");
  v5[12] = CFSTR("cloudPersonID");
  v5[13] = CFSTR("cloudRelationshipState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "arrayByAddingObjectsFromArray:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)propertiesToFetchWithHint__array_42170;
  propertiesToFetchWithHint__array_42170 = v3;

}

id __73__PHCloudSharedAlbum_fetchCloudSharedAlbumsWithLocalIdentifiers_options___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForCloudSharedAlbumsWithLocalIdentifiers:options:](PHQuery, "queryForCloudSharedAlbumsWithLocalIdentifiers:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
