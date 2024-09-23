@implementation PHFaceGroupChangeRequest

- (id)initForNewObject
{
  PHFaceGroupChangeRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v5;
  PHRelationshipChangeRequestHelper *facesHelper;
  PHRelationshipChangeRequestHelper *v7;
  PHRelationshipChangeRequestHelper *keyFaceHelper;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHFaceGroupChangeRequest;
  v2 = -[PHChangeRequest init](&v10, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

    v5 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("faces"), v2->super._helper);
    facesHelper = v2->_facesHelper;
    v2->_facesHelper = v5;

    v7 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("keyFace"), v2->super._helper);
    keyFaceHelper = v2->_keyFaceHelper;
    v2->_keyFaceHelper = v7;

  }
  return v2;
}

- (PHFaceGroupChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHFaceGroupChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v11;
  PHRelationshipChangeRequestHelper *facesHelper;
  PHRelationshipChangeRequestHelper *v13;
  PHRelationshipChangeRequestHelper *keyFaceHelper;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHFaceGroupChangeRequest;
  v8 = -[PHChangeRequest init](&v16, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

    v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("faces"), v8->super._helper);
    facesHelper = v8->_facesHelper;
    v8->_facesHelper = v11;

    v13 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("keyFace"), v8->super._helper);
    keyFaceHelper = v8->_keyFaceHelper;
    v8->_keyFaceHelper = v13;

  }
  return v8;
}

- (PHFaceGroupChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHFaceGroupChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v14;
  PHRelationshipChangeRequestHelper *facesHelper;
  PHRelationshipChangeRequestHelper *v16;
  PHRelationshipChangeRequestHelper *keyFaceHelper;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PHFaceGroupChangeRequest;
  v11 = -[PHChangeRequest init](&v19, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      v14 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("faces"), v8, v11->super._helper);
      facesHelper = v11->_facesHelper;
      v11->_facesHelper = v14;

      v16 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("keyFace"), v8, v11->super._helper);
      keyFaceHelper = v11->_keyFaceHelper;
      v11->_keyFaceHelper = v16;

    }
  }

  return v11;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeToXPCDict:", v4);

  -[PHFaceGroupChangeRequest facesHelper](self, "facesHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeToXPCDict:", v4);

  -[PHFaceGroupChangeRequest keyFaceHelper](self, "keyFaceHelper");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeToXPCDict:", v4);

}

- (PHObjectPlaceholder)placeholderForCreatedFaceGroup
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHObjectPlaceholder *)v4;
}

- (int64_t)unnamedFaceCount
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
  objc_msgSend(v4, "objectForKey:", CFSTR("unnamedFaceCount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setUnnamedFaceCount:(int64_t)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("unnamedFaceCount"));

}

- (NSString)managedEntityName
{
  return (NSString *)CFSTR("DetectedFaceGroup");
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  char v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  int v37;
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[PHChangeRequest helper](self, "helper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0;
  v9 = objc_msgSend(v8, "applyMutationsToManagedObject:error:", v7, &v45);
  v10 = v45;

  if (v9)
  {
    objc_msgSend(v7, "associatedPerson");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      objc_msgSend(MEMORY[0x1E0D71940], "createAssociatedPersonForFaceGroup:", v7);
      objc_msgSend(v7, "associatedPerson");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[PHFaceGroupChangeRequest facesHelper](self, "facesHelper");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "mutableObjectIDsAndUUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "setAllowsInsert:", 1);
      objc_msgSend(v12, "setAllowsMove:", 0);
      objc_msgSend(v12, "setAllowsRemove:", 1);
      objc_msgSend(v12, "setDestinationEntityName:", CFSTR("DetectedFace"));
      objc_msgSend(v7, "mutableDetectedFaces");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = v10;
      v37 = objc_msgSend(v12, "applyMutationsToManagedObject:unorderedMutableChildren:error:", v7, v14, &v44);
      v38 = v44;

      objc_msgSend(v7, "managedObjectContext");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHFaceGroupChangeRequest _prefetchFacesAndPersonRelationship:inContext:](self, "_prefetchFacesAndPersonRelationship:inContext:", v14, v15);

      objc_msgSend(v14, "_pl_filter:", &__block_literal_global_7368);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDetectedFaces:", v16);
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      v17 = v14;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v19; ++i)
          {
            if (*(_QWORD *)v41 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "fixPersonRelationshipsForFaceTorsoOrTemporal");
          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
        }
        while (v19);
      }

      -[PHFaceGroupChangeRequest keyFaceHelper](self, "keyFaceHelper");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v37)
      {
        v23 = 0;
        v10 = v38;
        goto LABEL_21;
      }
      v10 = v38;
    }
    else
    {
      -[PHFaceGroupChangeRequest keyFaceHelper](self, "keyFaceHelper");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v22, "mutableObjectIDsAndUUIDs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v22, "setAllowsInsert:", 1);
      objc_msgSend(v22, "setDestinationEntityName:", CFSTR("DetectedFace"));
      v39 = v10;
      v23 = objc_msgSend(v22, "applyMutationsToManagedObjectToOneRelationship:error:", v7, &v39);
      v25 = v39;

      v10 = v25;
    }
    else
    {
      v23 = 1;
    }
LABEL_21:
    objc_msgSend(v7, "keyFace");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26
      && (objc_msgSend(v11, "detectedFaces"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          v28 = objc_msgSend(v27, "containsObject:", v26),
          v27,
          (v28 & 1) == 0))
    {
      PLPhotoKitGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "faceGroupDescription");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v47 = v7;
        v48 = 2112;
        v49 = v35;
        _os_log_impl(&dword_1991EC000, v34, OS_LOG_TYPE_DEFAULT, "Cleearing key face for face group %@ and associated person : %@", buf, 0x16u);

      }
      objc_msgSend(v7, "setKeyFace:", 0);
      v33 = 0;
    }
    else
    {
      objc_msgSend(v26, "personBeingKeyFace");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
        goto LABEL_33;
      PLPhotoKitGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v47 = v7;
        v48 = 2112;
        v49 = v26;
        _os_log_impl(&dword_1991EC000, v30, OS_LOG_TYPE_DEBUG, "Face group should have key face: %@, %@", buf, 0x16u);
      }

      PLPhotoKitGetLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "faceGroupDescription");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v47 = v32;
        v48 = 2112;
        v49 = v26;
        _os_log_impl(&dword_1991EC000, v31, OS_LOG_TYPE_DEFAULT, "Setting key face of associated person %@ to face %@", buf, 0x16u);

      }
      v33 = v26;
    }
    objc_msgSend(v11, "setKeyFace:pickSource:", v33, 0);
LABEL_33:

    if (!a5)
      goto LABEL_36;
    goto LABEL_34;
  }
  v23 = 0;
  if (!a5)
    goto LABEL_36;
LABEL_34:
  if ((v23 & 1) == 0)
    *a5 = objc_retainAutorelease(v10);
LABEL_36:

  return v23;
}

- (void)_prefetchFacesAndPersonRelationship:(id)a3 inContext:(id)a4
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
  id v14;
  NSObject *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x19AEBEADC]();
  v8 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D716C8], "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self IN %@"), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setPredicate:", v11);

  v19[0] = CFSTR("personForFace");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRelationshipKeyPathsForPrefetching:", v12);

  objc_msgSend(v10, "setReturnsObjectsAsFaults:", 0);
  v16 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v10, &v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v16;
  if (!v13)
  {
    PLPhotoKitGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_impl(&dword_1991EC000, v15, OS_LOG_TYPE_ERROR, "Unable to prefetch faces: %@", buf, 0xCu);
    }

  }
  objc_autoreleasePoolPop(v7);

}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D716D0];
  objc_msgSend(a3, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertInManagedObjectContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!a4 || v8)
  {
    -[PHChangeRequest uuid](self, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setUuid:", v12);

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create face group"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v11);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)_existentFaceObjectIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_originalFaceGroup)
  {
    -[PHChangeRequest photoLibrary](self, "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "librarySpecificFetchOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setIncludedDetectionTypes:", &unk_1E3657138);
    +[PHQuery queryForFacesInFaceGroup:options:](PHQuery, "queryForFacesInFaceGroup:options:", self->_originalFaceGroup, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "executeQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchedObjectIDs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v7;
}

- (void)_prepareKeyFaceHelperIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  PHRelationshipChangeRequestHelper *keyFaceHelper;
  void *v7;
  id v8;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_keyFaceHelper, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_keyFaceHelper, "originalObjectIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_keyFaceHelper, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  }
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_keyFaceHelper, "mutableObjectIDsAndUUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    keyFaceHelper = self->_keyFaceHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](keyFaceHelper, "originalObjectIDs");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v8, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](keyFaceHelper, "setMutableObjectIDsAndUUIDs:", v7);

  }
}

- (void)_prepareFacesHelperIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PHRelationshipChangeRequestHelper *facesHelper;
  void *v9;
  id v10;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_facesHelper, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    if (self->_originalFaceGroup)
    {
      -[PHFaceGroupChangeRequest _existentFaceObjectIDs](self, "_existentFaceObjectIDs");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_facesHelper, "originalObjectIDs");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v5)
        -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_facesHelper, "setOriginalObjectIDs:", v4);

    }
    -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_facesHelper, "originalObjectIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_facesHelper, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  }
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_facesHelper, "mutableObjectIDsAndUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    facesHelper = self->_facesHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](facesHelper, "originalObjectIDs");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v10, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](facesHelper, "setMutableObjectIDsAndUUIDs:", v9);

  }
}

- (id)_mutableObjectIDsAndUUIDs
{
  -[PHFaceGroupChangeRequest _prepareFacesHelperIfNeeded](self, "_prepareFacesHelperIfNeeded");
  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_facesHelper, "mutableObjectIDsAndUUIDs");
}

- (id)_mutableKeyFaceObjectIDsAndUUIDs
{
  -[PHFaceGroupChangeRequest _prepareKeyFaceHelperIfNeeded](self, "_prepareKeyFaceHelperIfNeeded");
  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_keyFaceHelper, "mutableObjectIDsAndUUIDs");
}

- (void)addFaces:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!v7)
        {
          -[PHChangeRequest didMutate](self, "didMutate");
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        PLObjectIDOrUUIDFromPHObject(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
    if (v7)
    {
      -[PHFaceGroupChangeRequest _mutableObjectIDsAndUUIDs](self, "_mutableObjectIDsAndUUIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObjectsFromArray:", v7);

    }
  }

}

- (void)removeFaces:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!v7)
        {
          -[PHChangeRequest didMutate](self, "didMutate");
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }
        PLObjectIDOrUUIDFromPHObject(v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
    if (v7)
    {
      -[PHFaceGroupChangeRequest _mutableObjectIDsAndUUIDs](self, "_mutableObjectIDsAndUUIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectsInArray:", v7);

    }
  }

}

- (void)_setOriginalFaceGroup:(id)a3
{
  objc_storeStrong((id *)&self->_originalFaceGroup, a3);
}

- (void)setKeyFace:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (!v5)
      goto LABEL_10;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHFaceGroupChangeRequest.m"), 305, CFSTR("keyFace has incorrect class: %@"), v5);

    if (!v5)
      goto LABEL_10;
  }
  -[PHChangeRequest didMutate](self, "didMutate");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PLObjectIDOrUUIDFromPHObject(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);
  v8 = (void *)MEMORY[0x1E0C99E20];
  -[PHFaceGroupChangeRequest _existentFaceObjectIDs](self, "_existentFaceObjectIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_facesHelper, "mutableObjectIDsAndUUIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unionSet:", v12);

  }
  if ((objc_msgSend(v10, "containsObject:", v7) & 1) == 0)
  {
    v16[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHFaceGroupChangeRequest addFaces:](self, "addFaces:", v13);

  }
  if (v6)
  {
    -[PHFaceGroupChangeRequest _mutableKeyFaceObjectIDsAndUUIDs](self, "_mutableKeyFaceObjectIDsAndUUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObjectsFromArray:", v6);

  }
LABEL_10:

}

- (int64_t)personBuilderState
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
  objc_msgSend(v4, "objectForKey:", CFSTR("personBuilderState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (int)objc_msgSend(v5, "intValue");
  return v6;
}

- (void)setPersonBuilderState:(int64_t)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("personBuilderState"));

}

- (PHRelationshipChangeRequestHelper)facesHelper
{
  return self->_facesHelper;
}

- (PHRelationshipChangeRequestHelper)keyFaceHelper
{
  return self->_keyFaceHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyFaceHelper, 0);
  objc_storeStrong((id *)&self->_facesHelper, 0);
  objc_storeStrong((id *)&self->_originalFaceGroup, 0);
}

BOOL __77__PHFaceGroupChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  _BOOL8 v2;
  void *v3;
  void *v4;

  v2 = 1;
  objc_msgSend(a2, "associatedPersonForFaceOrTorso:orTemporal:", 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v2 = objc_msgSend(v3, "verifiedType") == 0;

  return v2;
}

+ (id)creationRequestForFaceGroup
{
  return -[PHFaceGroupChangeRequest initForNewObject]([PHFaceGroupChangeRequest alloc], "initForNewObject");
}

+ (id)changeRequestForFaceGroup:(id)a3
{
  id v3;
  void *v4;

  if (a3)
  {
    v3 = a3;
    +[PHChangeRequestHelper changeRequestForObject:](PHChangeRequestHelper, "changeRequestForObject:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setOriginalFaceGroup:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (void)deleteFaceGroups:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:ofType:forSelector:](PHFaceGroupDeleteRequest, "deleteRequestsForObjects:ofType:forSelector:", v5, objc_opt_class(), a2);

}

@end
