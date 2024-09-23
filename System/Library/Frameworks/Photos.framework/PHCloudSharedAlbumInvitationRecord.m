@implementation PHCloudSharedAlbumInvitationRecord

- (PHCloudSharedAlbumInvitationRecord)initWithFetchDictionary:(id)a3 propertyHint:(unint64_t)a4 photoLibrary:(id)a5
{
  id v8;
  PHCloudSharedAlbumInvitationRecord *v9;
  uint64_t v10;
  NSString *albumGUID;
  uint64_t v12;
  NSString *cloudGUID;
  uint64_t v14;
  NSString *inviteeFirstName;
  uint64_t v16;
  NSString *inviteeLastName;
  uint64_t v18;
  NSString *inviteeHashedPersonID;
  void *v20;
  uint64_t v21;
  NSNumber *invitationState;
  uint64_t v23;
  NSNumber *invitationStateLocal;
  objc_super v26;

  v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)PHCloudSharedAlbumInvitationRecord;
  v9 = -[PHObject initWithFetchDictionary:propertyHint:photoLibrary:](&v26, sel_initWithFetchDictionary_propertyHint_photoLibrary_, v8, a4, a5);
  if (v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("albumGUID"));
    v10 = objc_claimAutoreleasedReturnValue();
    albumGUID = v9->_albumGUID;
    v9->_albumGUID = (NSString *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("cloudGUID"));
    v12 = objc_claimAutoreleasedReturnValue();
    cloudGUID = v9->_cloudGUID;
    v9->_cloudGUID = (NSString *)v12;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inviteeFirstName"));
    v14 = objc_claimAutoreleasedReturnValue();
    inviteeFirstName = v9->_inviteeFirstName;
    v9->_inviteeFirstName = (NSString *)v14;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inviteeLastName"));
    v16 = objc_claimAutoreleasedReturnValue();
    inviteeLastName = v9->_inviteeLastName;
    v9->_inviteeLastName = (NSString *)v16;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("inviteeHashedPersonID"));
    v18 = objc_claimAutoreleasedReturnValue();
    inviteeHashedPersonID = v9->_inviteeHashedPersonID;
    v9->_inviteeHashedPersonID = (NSString *)v18;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isMine"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v9->_isMine = objc_msgSend(v20, "BOOLValue");

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("invitationState"));
    v21 = objc_claimAutoreleasedReturnValue();
    invitationState = v9->_invitationState;
    v9->_invitationState = (NSNumber *)v21;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("invitationStateLocal"));
    v23 = objc_claimAutoreleasedReturnValue();
    invitationStateLocal = v9->_invitationStateLocal;
    v9->_invitationStateLocal = (NSNumber *)v23;

  }
  return v9;
}

- (NSString)inviteeEmail
{
  void *v2;
  void *v3;

  -[PHCloudSharedAlbumInvitationRecord inviteeEmails](self, "inviteeEmails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)inviteePhone
{
  void *v2;
  void *v3;

  -[PHCloudSharedAlbumInvitationRecord inviteePhones](self, "inviteePhones");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSArray)inviteeEmails
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
  -[PHCloudSharedAlbumInvitationRecord cloudGUID](self, "cloudGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emailsForInvitationRecordGUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSArray)inviteePhones
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
  -[PHCloudSharedAlbumInvitationRecord cloudGUID](self, "cloudGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "phonesForInvitationRecordGUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v7;
}

- (NSString)cloudGUID
{
  return self->_cloudGUID;
}

- (void)setCloudGUID:(id)a3
{
  objc_storeStrong((id *)&self->_cloudGUID, a3);
}

- (NSString)albumGUID
{
  return self->_albumGUID;
}

- (void)setAlbumGUID:(id)a3
{
  objc_storeStrong((id *)&self->_albumGUID, a3);
}

- (NSString)inviteeFirstName
{
  return self->_inviteeFirstName;
}

- (NSString)inviteeLastName
{
  return self->_inviteeLastName;
}

- (NSString)inviteeHashedPersonID
{
  return self->_inviteeHashedPersonID;
}

- (void)setInviteeHashedPersonID:(id)a3
{
  objc_storeStrong((id *)&self->_inviteeHashedPersonID, a3);
}

- (BOOL)isMine
{
  return self->_isMine;
}

- (NSNumber)invitationState
{
  return self->_invitationState;
}

- (NSNumber)invitationStateLocal
{
  return self->_invitationStateLocal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationStateLocal, 0);
  objc_storeStrong((id *)&self->_invitationState, 0);
  objc_storeStrong((id *)&self->_inviteeHashedPersonID, 0);
  objc_storeStrong((id *)&self->_inviteeLastName, 0);
  objc_storeStrong((id *)&self->_inviteeFirstName, 0);
  objc_storeStrong((id *)&self->_albumGUID, 0);
  objc_storeStrong((id *)&self->_cloudGUID, 0);
}

+ (id)propertiesToFetchWithHint:(unint64_t)a3
{
  if (propertiesToFetchWithHint__onceToken != -1)
    dispatch_once(&propertiesToFetchWithHint__onceToken, &__block_literal_global);
  return (id)propertiesToFetchWithHint__propertiesToFetch;
}

+ (id)managedEntityName
{
  return CFSTR("CloudSharedAlbumInvitationRecord");
}

+ (id)fetchType
{
  __CFString *v2;

  v2 = CFSTR("PHCloudSharedAlbumInvitationRecord");
  return CFSTR("PHCloudSharedAlbumInvitationRecord");
}

+ (id)identifierCode
{
  return CFSTR("220");
}

+ (id)entityKeyMap
{
  pl_dispatch_once();
  return (id)entityKeyMap_pl_once_object_15;
}

+ (id)fetchAllInvitationRecordsWithOptions:(id)a3
{
  return +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", a3, &__block_literal_global_45);
}

+ (id)fetchInvitationRecordsForSharedAlbum:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__PHCloudSharedAlbumInvitationRecord_fetchInvitationRecordsForSharedAlbum___block_invoke;
  v9[3] = &unk_1E35DFCC0;
  v10 = v3;
  v6 = v3;
  +[PHObject authorizationAwareFetchResultWithOptions:fetchBlock:](PHObject, "authorizationAwareFetchResultWithOptions:fetchBlock:", v5, v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __75__PHCloudSharedAlbumInvitationRecord_fetchInvitationRecordsForSharedAlbum___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForCloudSharedAlbumInvitationRecordsForCloudSharedAlbum:options:](PHQuery, "queryForCloudSharedAlbumInvitationRecordsForCloudSharedAlbum:options:", *(_QWORD *)(a1 + 32), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __75__PHCloudSharedAlbumInvitationRecord_fetchAllInvitationRecordsWithOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  +[PHQuery queryForCloudSharedAlbumInvitationRecordsWithOptions:](PHQuery, "queryForCloudSharedAlbumInvitationRecordsWithOptions:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "executeQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __50__PHCloudSharedAlbumInvitationRecord_entityKeyMap__block_invoke()
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
  PHEntityKeyMap *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  _QWORD v22[9];
  _QWORD v23[11];

  v23[9] = *MEMORY[0x1E0C80C00];
  v12 = [PHEntityKeyMap alloc];
  v21 = CFSTR("uuid");
  v22[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v0;
  v22[1] = CFSTR("cloudGUID");
  v20 = CFSTR("cloudGUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v1;
  v22[2] = CFSTR("albumGUID");
  v19 = CFSTR("albumGUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v2;
  v22[3] = CFSTR("inviteeFirstName");
  v18 = CFSTR("inviteeFirstName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v3;
  v22[4] = CFSTR("inviteeLastName");
  v17 = CFSTR("inviteeLastName");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v4;
  v22[5] = CFSTR("inviteeHashedPersonID");
  v16 = CFSTR("inviteeHashedPersonID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v5;
  v22[6] = CFSTR("isMine");
  v15 = CFSTR("isMine");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[6] = v6;
  v22[7] = CFSTR("invitationState");
  v14 = CFSTR("invitationState");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[7] = v7;
  v22[8] = CFSTR("invitationStateLocal");
  v13 = CFSTR("invitationStateLocal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHEntityKeyMap initWithPropertyKeysByEntityKey:](v12, "initWithPropertyKeysByEntityKey:", v9);
  v11 = (void *)entityKeyMap_pl_once_object_15;
  entityKeyMap_pl_once_object_15 = v10;

}

void __64__PHCloudSharedAlbumInvitationRecord_propertiesToFetchWithHint___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[11];

  v3[10] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D718A8], "objectIDDescription");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = v0;
  v3[1] = CFSTR("uuid");
  v3[2] = CFSTR("albumGUID");
  v3[3] = CFSTR("cloudGUID");
  v3[4] = CFSTR("inviteeFirstName");
  v3[5] = CFSTR("inviteeLastName");
  v3[6] = CFSTR("inviteeHashedPersonID");
  v3[7] = CFSTR("isMine");
  v3[8] = CFSTR("invitationState");
  v3[9] = CFSTR("invitationStateLocal");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 10);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)propertiesToFetchWithHint__propertiesToFetch;
  propertiesToFetchWithHint__propertiesToFetch = v1;

}

@end
