@implementation PHChangeRequestHelper

- (PHChangeRequestHelper)initWithUUID:(id)a3 objectID:(id)a4 isNew:(BOOL)a5 changeRequest:(id)a6
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  PHChangeRequestHelper *v15;
  PHChangeRequestHelper *v16;
  uint64_t v17;
  NSMutableDictionary *mutations;
  uint64_t v19;
  NSMutableSet *nilMutations;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  uint32_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  objc_super v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v7 = a5;
  v38 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHChangeRequestHelper.m"), 87, CFSTR("Must provide a change request"));

  }
  v31.receiver = self;
  v31.super_class = (Class)PHChangeRequestHelper;
  v15 = -[PHChangeRequestHelper init](&v31, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_uuid, a3);
    objc_storeStrong((id *)&v16->_objectID, a4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    mutations = v16->_mutations;
    v16->_mutations = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = objc_claimAutoreleasedReturnValue();
    nilMutations = v16->_nilMutations;
    v16->_nilMutations = (NSMutableSet *)v19;

    objc_storeWeak((id *)&v16->_changeRequest, v14);
    +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21 || (PLIsAssetsd() & 1) != 0)
    {
      if (v13)
        goto LABEL_11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("PHChangeRequestHelper.m"), 96, CFSTR("must be in a transaction PHPhotoLibrary or be running in assetsd"));

      if (v13)
        goto LABEL_11;
    }
    if (!v7)
    {
      PLPhotoKitGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
      {
        v23 = objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v33 = v23;
        v34 = 2112;
        v35 = v14;
        v24 = "Invalid change request %{public}@ %@ with isNew = NO and objectID = nil";
        v25 = v22;
        v26 = 22;
LABEL_15:
        _os_log_impl(&dword_1991EC000, v25, OS_LOG_TYPE_FAULT, v24, buf, v26);
        goto LABEL_16;
      }
      goto LABEL_16;
    }
LABEL_11:
    if (!v13 || !v7)
    {
      if (v12)
        objc_msgSend(v21, "setChangeRequest:forUUID:", v14, v12);
      if (!v13)
      {
        objc_msgSend(v21, "recordInsertRequest:", v14);
        *(_WORD *)&v16->_isMutated = 257;
      }
      goto LABEL_17;
    }
    PLPhotoKitGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      v29 = objc_opt_class();
      *(_DWORD *)buf = 138543874;
      v33 = v29;
      v34 = 2112;
      v35 = v14;
      v36 = 2114;
      v37 = v13;
      v24 = "Invalid change request %{public}@ %@ with isNew = YES and objectID = %{public}@";
      v25 = v22;
      v26 = 32;
      goto LABEL_15;
    }
LABEL_16:

    v16 = 0;
LABEL_17:

  }
  return v16;
}

- (PHChangeRequestHelper)initWithUUID:(id)a3 objectID:(id)a4 changeRequest:(id)a5
{
  PHChangeRequestHelper *v5;
  PHClientLinkedAgainst *v6;
  PHClientLinkedAgainst *clientLinkedAgainst;

  v5 = -[PHChangeRequestHelper initWithUUID:objectID:isNew:changeRequest:](self, "initWithUUID:objectID:isNew:changeRequest:", a3, a4, 0, a5);
  if (v5)
  {
    v6 = objc_alloc_init(PHClientLinkedAgainst);
    clientLinkedAgainst = v5->_clientLinkedAgainst;
    v5->_clientLinkedAgainst = v6;

  }
  return v5;
}

- (id)initForNewObjectWithChangeRequest:(id)a3
{
  return -[PHChangeRequestHelper initForNewObjectWithUUID:changeRequest:](self, "initForNewObjectWithUUID:changeRequest:", 0, a3);
}

- (id)initForNewObjectWithUUID:(id)a3 changeRequest:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PHChangeRequestHelper *v10;
  PHClientLinkedAgainst *v11;
  PHClientLinkedAgainst *clientLinkedAgainst;
  void *v14;

  v7 = a3;
  v8 = a4;
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  if (v8)
  {
    if (v7)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHChangeRequestHelper.m"), 136, CFSTR("Must provide a change request"));

  if (!v7)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:
  objc_msgSend(v7, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PHChangeRequestHelper initWithUUID:objectID:isNew:changeRequest:](self, "initWithUUID:objectID:isNew:changeRequest:", v9, 0, 1, v8);

  if (v10)
  {
    v11 = objc_alloc_init(PHClientLinkedAgainst);
    clientLinkedAgainst = v10->_clientLinkedAgainst;
    v10->_clientLinkedAgainst = v11;

  }
  return v10;
}

- (PHChangeRequestHelper)initWithXPCDict:(id)a3 changeRequest:(id)a4 request:(id)a5 clientAuthorization:(id)a6
{
  id v11;
  id v12;
  PHPerformChangesRequest *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  PHChangeRequestHelper *v19;
  void *v20;
  uint64_t v21;
  NSMutableDictionary *mutations;
  void *v23;
  void *v24;
  uint64_t v25;
  NSMutableSet *nilMutations;
  PHClientLinkedAgainst *v27;
  PHClientLinkedAgainst *clientLinkedAgainst;
  void *v29;
  void *v30;
  uint64_t v31;
  NSString *uuid;
  void *v34;
  id v35;

  v11 = a3;
  v12 = a4;
  v13 = (PHPerformChangesRequest *)a5;
  v35 = a6;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHChangeRequestHelper.m"), 150, CFSTR("Must provide a change request"));

  }
  -[PHPerformChangesRequest persistentStoreCoordinator](v13, "persistentStoreCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v11, "objectID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    PLManagedObjectIDFromXPCValue();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  v17 = xpc_dictionary_get_BOOL(v11, "isNewRequest");
  PLStringFromXPCDictionary();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PHChangeRequestHelper initWithUUID:objectID:isNew:changeRequest:](self, "initWithUUID:objectID:isNew:changeRequest:", v18, v16, v17, v12);

  if (v19)
  {
    v19->_request = v13;
    objc_storeStrong((id *)&v19->_clientAuthorization, a6);
    PLDictionaryFromXPCDictionary();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "mutableCopy");
    mutations = v19->_mutations;
    v19->_mutations = (NSMutableDictionary *)v21;

    v23 = (void *)MEMORY[0x1E0C99E20];
    PLArrayFromXPCDictionary();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWithArray:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    nilMutations = v19->_nilMutations;
    v19->_nilMutations = (NSMutableSet *)v25;

    v19->_isNewRequest = v17;
    v27 = -[PHClientLinkedAgainst initWithXPCDict:]([PHClientLinkedAgainst alloc], "initWithXPCDict:", v11);
    clientLinkedAgainst = v19->_clientLinkedAgainst;
    v19->_clientLinkedAgainst = v27;

    if (!v16)
      -[PHPerformChangesRequest recordInsertRequest:](v13, "recordInsertRequest:", v12);
    -[PHChangeRequestHelper uuid](v19, "uuid");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "UUIDString");
      v31 = objc_claimAutoreleasedReturnValue();
      uuid = v19->_uuid;
      v19->_uuid = (NSString *)v31;

    }
    if (-[NSMutableDictionary count](v19->_mutations, "count") || -[NSMutableSet count](v19->_nilMutations, "count"))
    {
      -[PHPerformChangesRequest recordUpdateRequest:](v13, "recordUpdateRequest:", v12);
      v19->_isMutated = 1;
    }
  }

  return v19;
}

- (PHChangeRequestHelper)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("-[PHChangeRequestHelper init] unsupported"), 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

- (BOOL)prepareForServicePreflightCheck:(id *)a3
{
  return 1;
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
  if (a4 && v5)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v10 = *MEMORY[0x1E0CB2D50];
    v11[0] = CFSTR("Change must be performed within the sharedPhotoLibrary");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6 == 0;
}

- (id)placeholderForCreatedObjectWithClass:(Class)a3 changeRequest:(id)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *uuid;
  void *v12;
  void *v13;
  PHObjectPlaceholder *v14;

  v6 = a4;
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  v7 = objc_msgSend(v6, "isNewRequest");

  if (v7)
  {
    -[PHChangeRequestHelper uuid](self, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (NSString *)objc_claimAutoreleasedReturnValue();
      uuid = self->_uuid;
      self->_uuid = v10;

    }
    -[PHChangeRequestHelper uuid](self, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class localIdentifierWithUUID:](a3, "localIdentifierWithUUID:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[PHObjectPlaceholder initWithLocalIdentifier:]([PHObjectPlaceholder alloc], "initWithLocalIdentifier:", v13);
  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)didMutate
{
  void *v3;
  void *v4;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  if (!self->_isMutated)
  {
    +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHChangeRequestHelper changeRequest](self, "changeRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recordUpdateRequest:", v4);

    self->_isMutated = 1;
  }
}

- (BOOL)isMutated
{
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  return self->_isMutated;
}

- (void)setMutated:(BOOL)a3
{
  self->_isMutated = a3;
}

- (BOOL)isNewRequest
{
  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  return self->_isNewRequest;
}

- (void)setNewRequest:(BOOL)a3
{
  self->_isNewRequest = a3;
}

- (BOOL)isClientEntitled
{
  return -[PLClientAuthorization photoKitEntitled](self->_clientAuthorization, "photoKitEntitled");
}

- (BOOL)isClientInLimitedLibraryMode
{
  return -[PLClientAuthorization limitedLibraryMode](self->_clientAuthorization, "limitedLibraryMode");
}

- (NSString)clientDisplayName
{
  return (NSString *)-[PLClientAuthorization trustedCallerDisplayName](self->_clientAuthorization, "trustedCallerDisplayName");
}

- (NSString)clientBundleIdentifier
{
  NSObject *v3;
  int v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PLClientAuthorization trustedCallerBundleID](self->_clientAuthorization, "trustedCallerBundleID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject length](v3, "length"))
  {
    v5 = MEMORY[0x19AEBDEDC]();

    if (!v5)
      goto LABEL_3;
    PLPhotoKitGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      v6 = (int)-[PLClientAuthorization clientProcessIdentifier](self->_clientAuthorization, "clientProcessIdentifier");
      -[PHChangeRequestHelper clientDisplayName](self, "clientDisplayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218242;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_FAULT, "Client has no bundle identifier. PID %ld, name %@", (uint8_t *)&v8, 0x16u);

    }
  }

LABEL_3:
  -[PLClientAuthorization trustedCallerBundleID](self->_clientAuthorization, "trustedCallerBundleID");
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)fetchFilterIdentifier
{
  return (NSString *)-[PLClientAuthorization fetchFilterIdentifier](self->_clientAuthorization, "fetchFilterIdentifier");
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PHChangeRequestHelper changeRequest](self, "changeRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "managedEntityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  PLSafeInsertNewObjectForEntityForNameInManagedObjectContext();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;

  if (a4 && !v10)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB3388];
    v16[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v13);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[PHChangeRequestHelper changeRequest](self, "changeRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "managedEntityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PLSafeEntityForNameInManagedObjectContext();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;

  if (!v13)
  {
    if (!a5)
    {
      v20 = 0;
      goto LABEL_13;
    }
    v21 = v14;
LABEL_11:
    v14 = objc_retainAutorelease(v21);
    v20 = 0;
    *a5 = v14;
    goto LABEL_13;
  }
  objc_msgSend(v8, "entity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isKindOfEntity:", v13);

  if (!v16)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v29 = *MEMORY[0x1E0CB2D50];
    v23 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Invalid entity %@"), v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v25;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v26 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (id)v26;
    goto LABEL_10;
  }
  objc_msgSend(v8, "entity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "attributesByName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKey:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v31 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid property %@"), v9);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

    if (!a5)
    {
      v20 = 0;
      v14 = v21;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  v20 = 1;
LABEL_13:

  return v20;
}

- (BOOL)validateMutationsToManagedObject:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;

  -[PHChangeRequestHelper validateMutationsToManagedObject:](self, "validateMutationsToManagedObject:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resultWithError:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = v6 != 0;

  return (char)a4;
}

- (id)validateMutationsToManagedObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *mutations;
  id v10;
  NSMutableSet *nilMutations;
  id v12;
  _QWORD v14[5];
  id v15;
  _QWORD *v16;
  uint64_t *v17;
  _QWORD v18[5];
  id v19;
  _QWORD *v20;
  uint64_t *v21;
  _QWORD v22[5];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__7891;
  v28 = __Block_byref_object_dispose__7892;
  v5 = (void *)MEMORY[0x1E0D732B8];
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "successWithResult:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v7;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__7891;
  v22[4] = __Block_byref_object_dispose__7892;
  v23 = 0;
  if (self->_isMutated)
  {
    v8 = MEMORY[0x1E0C809B0];
    mutations = self->_mutations;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __58__PHChangeRequestHelper_validateMutationsToManagedObject___block_invoke;
    v18[3] = &unk_1E35D7408;
    v18[4] = self;
    v10 = v4;
    v19 = v10;
    v20 = v22;
    v21 = &v24;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mutations, "enumerateKeysAndObjectsUsingBlock:", v18);
    nilMutations = self->_nilMutations;
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __58__PHChangeRequestHelper_validateMutationsToManagedObject___block_invoke_2;
    v14[3] = &unk_1E35D7430;
    v14[4] = self;
    v15 = v10;
    v16 = v22;
    v17 = &v24;
    -[NSMutableSet enumerateObjectsUsingBlock:](nilMutations, "enumerateObjectsUsingBlock:", v14);

  }
  v12 = (id)v25[5];
  _Block_object_dispose(v22, 8);

  _Block_object_dispose(&v24, 8);
  return v12;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *mutations;
  id v10;
  NSMutableSet *nilMutations;
  int v12;
  BOOL v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  uint64_t *v18;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 1;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__7891;
  v27 = __Block_byref_object_dispose__7892;
  v28 = 0;
  if (self->_isMutated)
  {
    v8 = MEMORY[0x1E0C809B0];
    mutations = self->_mutations;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__PHChangeRequestHelper_applyMutationsToManagedObject_error___block_invoke;
    v19[3] = &unk_1E35D7408;
    v19[4] = self;
    v10 = v6;
    v20 = v10;
    v21 = &v23;
    v22 = &v29;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mutations, "enumerateKeysAndObjectsUsingBlock:", v19);
    nilMutations = self->_nilMutations;
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __61__PHChangeRequestHelper_applyMutationsToManagedObject_error___block_invoke_2;
    v15[3] = &unk_1E35D7430;
    v15[4] = self;
    v16 = v10;
    v17 = &v23;
    v18 = &v29;
    -[NSMutableSet enumerateObjectsUsingBlock:](nilMutations, "enumerateObjectsUsingBlock:", v15);

  }
  v12 = *((unsigned __int8 *)v30 + 24);
  if (a4 && !*((_BYTE *)v30 + 24))
  {
    *a4 = objc_retainAutorelease((id)v24[5]);
    v12 = *((unsigned __int8 *)v30 + 24);
  }
  v13 = v12 != 0;
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v13;
}

- (void)encodeToXPCDict:(id)a3
{
  PHClientLinkedAgainst *clientLinkedAgainst;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  xpc_object_t xdict;

  clientLinkedAgainst = self->_clientLinkedAgainst;
  xdict = a3;
  -[PHClientLinkedAgainst encodeToXPCDict:](clientLinkedAgainst, "encodeToXPCDict:", xdict);
  -[PHChangeRequestHelper uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  -[PHChangeRequestHelper changeRequest](self, "changeRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  -[PHChangeRequestHelper objectID](self, "objectID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetManagedObjectID();

  -[PHChangeRequestHelper mutations](self, "mutations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetDictionary();

  -[PHChangeRequestHelper nilMutations](self, "nilMutations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetArray();

  xpc_dictionary_set_BOOL(xdict, "isNewRequest", -[PHChangeRequestHelper isNewRequest](self, "isNewRequest"));
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHChangeRequestHelper;
  -[PHChangeRequestHelper description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "appendFormat:", CFSTR(" _uuid %@"), self->_uuid);
  objc_msgSend(v4, "appendFormat:", CFSTR(" _isMutated %d"), self->_isMutated);
  objc_msgSend(v4, "appendFormat:", CFSTR(" _isNewRequest %d"), self->_isNewRequest);
  objc_msgSend(v4, "appendFormat:", CFSTR(" _mutations %@"), self->_mutations);
  objc_msgSend(v4, "appendFormat:", CFSTR(" _nilMutations %@"), self->_nilMutations);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  -[PHChangeRequestHelper uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v4, v5);

  -[PHChangeRequestHelper changeRequest](self, "changeRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "className");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v8, v9);

  -[PHChangeRequestHelper mutations](self, "mutations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "mutations");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v10, v11);

  -[PHChangeRequestHelper nilMutations](self, "nilMutations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nilMutations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeObject:forKey:", v12, v13);

  v14 = -[PHChangeRequestHelper isNewRequest](self, "isNewRequest");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "isNewRequest");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "encodeBool:forKey:", v14, v15);

  -[PHChangeRequestHelper objectID](self, "objectID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PHChangeRequestHelper objectID](self, "objectID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PLDataFromManagedObjectID();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "objectID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "encodeObject:forKey:", v18, v19);

  }
}

- (PHChangeRequestHelper)initWithCoder:(id)a3
{
  id v4;
  PHChangeRequestHelper *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *uuid;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSManagedObjectID *objectID;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSMutableDictionary *mutations;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSMutableSet *nilMutations;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)PHChangeRequestHelper;
  v5 = -[PHChangeRequestHelper init](&v46, sel_init);
  if (v5)
  {
    v6 = v4;
    if (v6)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable _PLAssertRespondsToSelector(id  _Nullable __strong, SEL _Nonnull)");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(sel_userInfo);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v41, CFSTR("PLHelperExtension.h"), 89, CFSTR("Object does not respond to selector %@: %@"), v42, v6);

      }
      v7 = v6;
    }
    v45 = v4;

    objc_msgSend(v6, "userInfo");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "persistentStoreCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "isNewRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isNewRequest = objc_msgSend(v6, "decodeBoolForKey:", v13);

    v14 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "objectID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      PLManagedObjectIDFromData();
      v17 = objc_claimAutoreleasedReturnValue();
      objectID = v5->_objectID;
      v5->_objectID = (NSManagedObjectID *)v17;

    }
    v19 = (void *)MEMORY[0x1E0C99E60];
    v20 = objc_opt_class();
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v43 = (void *)v16;
    v23 = objc_opt_class();
    v24 = objc_opt_class();
    objc_msgSend(v19, "setWithObjects:", v20, v21, v22, v23, v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "mutations");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    mutations = v5->_mutations;
    v5->_mutations = (NSMutableDictionary *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    v34 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, v31, v32, v33, v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "nilMutations");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "decodeObjectOfClasses:forKey:", v35, v36);
    v37 = objc_claimAutoreleasedReturnValue();
    nilMutations = v5->_nilMutations;
    v5->_nilMutations = (NSMutableSet *)v37;

    v4 = v45;
  }

  return v5;
}

- (NSMutableDictionary)mutations
{
  return self->_mutations;
}

- (NSMutableSet)nilMutations
{
  return self->_nilMutations;
}

- (PLClientAuthorization)clientAuthorization
{
  return self->_clientAuthorization;
}

- (PHChangeRequest)changeRequest
{
  return (PHChangeRequest *)objc_loadWeakRetained((id *)&self->_changeRequest);
}

- (void)setChangeRequest:(id)a3
{
  objc_storeWeak((id *)&self->_changeRequest, a3);
}

- (PHPerformChangesRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
  self->_request = (PHPerformChangesRequest *)a3;
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (void)setObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_objectID, a3);
}

- (PHClientLinkedAgainst)clientLinkedAgainst
{
  return self->_clientLinkedAgainst;
}

- (void)setClientLinkedAgainst:(id)a3
{
  objc_storeStrong((id *)&self->_clientLinkedAgainst, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientLinkedAgainst, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_destroyWeak((id *)&self->_changeRequest);
  objc_storeStrong((id *)&self->_clientAuthorization, 0);
  objc_storeStrong((id *)&self->_nilMutations, 0);
  objc_storeStrong((id *)&self->_mutations, 0);
}

void __61__PHChangeRequestHelper_applyMutationsToManagedObject_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id obj;

  v7 = a2;
  v8 = a3;
  objc_msgSend(*(id *)(a1 + 32), "changeRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 40);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v11 + 40);
  v12 = objc_msgSend(v9, "allowMutationToManagedObject:propertyKey:error:", v10, v7, &obj);
  objc_storeStrong((id *)(v11 + 40), obj);

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", v8, v7);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *a4 = 1;
  }

}

void __61__PHChangeRequestHelper_applyMutationsToManagedObject_error___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  id obj;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "changeRequest");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v8 + 40);
  v9 = objc_msgSend(v6, "allowMutationToManagedObject:propertyKey:error:", v7, v5, &obj);
  objc_storeStrong((id *)(v8 + 40), obj);

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "setValue:forKey:", 0, v5);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    *a3 = 1;
  }

}

void __58__PHChangeRequestHelper_validateMutationsToManagedObject___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id obj;

  v6 = (void *)a1[4];
  v7 = a2;
  objc_msgSend(v6, "changeRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a1[5];
  v10 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "allowMutationToManagedObject:propertyKey:error:", v9, v7, &obj);

  objc_storeStrong((id *)(v10 + 40), obj);
  if ((v11 & 1) == 0)
  {
    +[PHChangeRequest sanitizedFailureWithError:](PHChangeRequest, "sanitizedFailureWithError:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1[7] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *a4 = 1;
  }
}

void __58__PHChangeRequestHelper_validateMutationsToManagedObject___block_invoke_2(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id obj;

  v5 = (void *)a1[4];
  v6 = a2;
  objc_msgSend(v5, "changeRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a1[5];
  v9 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v9 + 40);
  v10 = objc_msgSend(v7, "allowMutationToManagedObject:propertyKey:error:", v8, v6, &obj);

  objc_storeStrong((id *)(v9 + 40), obj);
  if ((v10 & 1) == 0)
  {
    +[PHChangeRequest sanitizedFailureWithError:](PHChangeRequest, "sanitizedFailureWithError:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[7] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *a3 = 1;
  }
}

+ (id)changeRequestForObject:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;

  v5 = a3;
  objc_msgSend(v5, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changeRequestForUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = (objc_class *)objc_msgSend(v5, "changeRequestClass");
    if (v9)
    {
      v10 = [v9 alloc];
      objc_msgSend(v5, "objectID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v10, "initWithUUID:objectID:", v6, v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHChangeRequestHelper.m"), 75, CFSTR("Unsupported change request type!"));
      v8 = 0;
    }

  }
  return v8;
}

+ (id)changeRequestWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSString *v12;
  objc_class *v13;
  void *v14;
  void *v16;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  PLStringFromXPCDictionary();
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  v13 = NSClassFromString(v12);
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHChangeRequestHelper.m"), 384, CFSTR("encoded missing 'className' field: %@"), v9);

  }
  v14 = (void *)objc_msgSend([v13 alloc], "initWithXPCDict:request:clientAuthorization:", v9, v11, v10);

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
