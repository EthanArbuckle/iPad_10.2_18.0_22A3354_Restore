@implementation PHFaceCropChangeRequest

- (id)initForNewObject
{
  PHFaceCropChangeRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v5;
  PHRelationshipChangeRequestHelper *faceHelper;
  PHRelationshipChangeRequestHelper *v7;
  PHRelationshipChangeRequestHelper *personHelper;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHFaceCropChangeRequest;
  v2 = -[PHChangeRequest init](&v10, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

    v5 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("face"), v2->super._helper);
    faceHelper = v2->_faceHelper;
    v2->_faceHelper = v5;

    v7 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("person"), v2->super._helper);
    personHelper = v2->_personHelper;
    v2->_personHelper = v7;

  }
  return v2;
}

- (PHFaceCropChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHFaceCropChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v11;
  PHRelationshipChangeRequestHelper *faceHelper;
  PHRelationshipChangeRequestHelper *v13;
  PHRelationshipChangeRequestHelper *personHelper;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PHFaceCropChangeRequest;
  v8 = -[PHChangeRequest init](&v16, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

    v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("face"), v8->super._helper);
    faceHelper = v8->_faceHelper;
    v8->_faceHelper = v11;

    v13 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("person"), v8->super._helper);
    personHelper = v8->_personHelper;
    v8->_personHelper = v13;

  }
  return v8;
}

- (PHObjectPlaceholder)placeholderForCreatedFaceCrop
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHObjectPlaceholder *)v4;
}

- (void)_prepareFaceHelperIfNeeded
{
  void *v3;
  void *v4;
  PHRelationshipChangeRequestHelper *faceHelper;
  void *v6;
  id v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_faceHelper, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_faceHelper, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_faceHelper, "mutableObjectIDsAndUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    faceHelper = self->_faceHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](faceHelper, "originalObjectIDs");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](faceHelper, "setMutableObjectIDsAndUUIDs:", v6);

  }
}

- (void)_preparePersonHelperIfNeeded
{
  void *v3;
  void *v4;
  PHRelationshipChangeRequestHelper *personHelper;
  void *v6;
  id v7;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHRelationshipChangeRequestHelper originalObjectIDs](self->_personHelper, "originalObjectIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[PHRelationshipChangeRequestHelper setOriginalObjectIDs:](self->_personHelper, "setOriginalObjectIDs:", MEMORY[0x1E0C9AA60]);
  -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_personHelper, "mutableObjectIDsAndUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    personHelper = self->_personHelper;
    -[PHRelationshipChangeRequestHelper originalObjectIDs](personHelper, "originalObjectIDs");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v7, "mutableCopy");
    -[PHRelationshipChangeRequestHelper setMutableObjectIDsAndUUIDs:](personHelper, "setMutableObjectIDsAndUUIDs:", v6);

  }
}

- (id)_mutableFaceObjectIDsAndUUIDs
{
  -[PHFaceCropChangeRequest _prepareFaceHelperIfNeeded](self, "_prepareFaceHelperIfNeeded");
  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_faceHelper, "mutableObjectIDsAndUUIDs");
}

- (id)_mutablePersonObjectIDsAndUUIDs
{
  -[PHFaceCropChangeRequest _preparePersonHelperIfNeeded](self, "_preparePersonHelperIfNeeded");
  return -[PHRelationshipChangeRequestHelper mutableObjectIDsAndUUIDs](self->_personHelper, "mutableObjectIDsAndUUIDs");
}

- (void)setFace:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHFaceCropChangeRequest.m"), 160, CFSTR("face has incorrect class: %@"), v9);

    }
  }
  PLObjectIDOrUUIDFromPHObject(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFaceCropChangeRequest _mutableFaceObjectIDsAndUUIDs](self, "_mutableFaceObjectIDsAndUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeAllObjects");

  -[PHFaceCropChangeRequest _mutableFaceObjectIDsAndUUIDs](self, "_mutableFaceObjectIDsAndUUIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v5);

}

- (NSData)resourceData
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("resourceData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v5;
}

- (void)setResourceData:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("resourceData"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("resourceData"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("resourceData"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("resourceData"));
  }

}

- (signed)state
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "shortValue");
  return (__int16)v3;
}

- (void)setState:(signed __int16)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("state"));

}

- (signed)type
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "shortValue");
  return (__int16)v3;
}

- (void)setType:(signed __int16)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("type"));

}

- (PHFaceCropChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHFaceCropChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v14;
  PHRelationshipChangeRequestHelper *faceHelper;
  PHRelationshipChangeRequestHelper *v16;
  PHRelationshipChangeRequestHelper *personHelper;
  uint64_t v18;
  NSString *originatingFaceUUID;
  uint64_t v20;
  NSString *originatingFaceCropUUID;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)PHFaceCropChangeRequest;
  v11 = -[PHChangeRequest init](&v23, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      v14 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("face"), v8, v11->super._helper);
      faceHelper = v11->_faceHelper;
      v11->_faceHelper = v14;

      v16 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("person"), v8, v11->super._helper);
      personHelper = v11->_personHelper;
      v11->_personHelper = v16;

      PLStringFromXPCDictionary();
      v18 = objc_claimAutoreleasedReturnValue();
      originatingFaceUUID = v11->_originatingFaceUUID;
      v11->_originatingFaceUUID = (NSString *)v18;

      PLStringFromXPCDictionary();
      v20 = objc_claimAutoreleasedReturnValue();
      originatingFaceCropUUID = v11->_originatingFaceCropUUID;
      v11->_originatingFaceCropUUID = (NSString *)v20;

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
  id v9;

  v4 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeToXPCDict:", v4);

  -[PHFaceCropChangeRequest faceHelper](self, "faceHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeToXPCDict:", v4);

  -[PHFaceCropChangeRequest personHelper](self, "personHelper");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeToXPCDict:", v4);

  -[PHFaceCropChangeRequest originatingFaceUUID](self, "originatingFaceUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

  -[PHFaceCropChangeRequest originatingFaceCropUUID](self, "originatingFaceCropUUID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetString();

}

- (NSString)managedEntityName
{
  return (NSString *)CFSTR("FaceCrop");
}

- (BOOL)validateInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v6;
  BOOL v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;

  -[PHFaceCropChangeRequest originatingFaceCropUUID](self, "originatingFaceCropUUID", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    return 1;
  -[PHFaceCropChangeRequest originatingFaceUUID](self, "originatingFaceUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v8)
  {
    v9 = CFSTR("All FaceCrops require an originating face UUID");
LABEL_10:
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3300, v9);
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  if (!v8)
    return 0;
  -[PHFaceCropChangeRequest _mutablePersonObjectIDsAndUUIDs](self, "_mutablePersonObjectIDsAndUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v7 = v11 == 1;

  if (a4 && v11 != 1)
  {
    v9 = CFSTR("All FaceCrops require a person");
    goto LABEL_10;
  }
  return v7;
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
  uint64_t v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  char v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  const __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  char v50;
  uint64_t v51;
  void *v52;
  void *v53;
  id v54;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id *v66;
  void *v67;
  id v68;
  uint8_t buf[4];
  void *v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PHFaceCropChangeRequest originatingFaceCropUUID](self, "originatingFaceCropUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v20 = (void *)MEMORY[0x1E0D716C8];
    -[PHFaceCropChangeRequest originatingFaceUUID](self, "originatingFaceUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "managedObjectContext");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "detectedFaceWithUUID:inManagedObjectContext:", v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "associatedAssetForFaceOrTorso:orTemporal:", 0, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = a4;
    if (v24)
    {
      v16 = 0;
      v25 = 1;
    }
    else
    {
      PLPhotoKitGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v26, OS_LOG_TYPE_ERROR, "Attempting to create a face crop for a face with no asset, this is not allowed", buf, 2u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3300, CFSTR("Attempting to create a face crop for a face with no asset, this is not allowed"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      v25 = 0;
    }
    -[PHFaceCropChangeRequest _mutablePersonObjectIDsAndUUIDs](self, "_mutablePersonObjectIDsAndUUIDs");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v28 = objc_claimAutoreleasedReturnValue();

    v29 = (void *)MEMORY[0x1E0D71940];
    objc_msgSend(v6, "managedObjectContext");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v29;
    v32 = (void *)v28;
    objc_msgSend(v31, "personWithUUID:inManagedObjectContext:", v28, v30);
    v33 = objc_claimAutoreleasedReturnValue();

    v67 = (void *)v33;
    if (!v24)
    {
      v36 = 0;
LABEL_29:
      if (v25)
      {
        PLPhotoKitGetLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_ERROR, "Creating a faceCrop with 'None' type is invalid, possible race condition, correct resolution is to retry faceCrop creation request", buf, 2u);
        }
        v39 = CFSTR("Creating a faceCrop with 'None' type is invalid, possible race condition, correct resolution is to retry faceCrop creation request");
        goto LABEL_42;
      }
LABEL_33:
      if (!v25)
      {
LABEL_43:
        v46 = v67;
        if (v66)
        {
          if (!v16)
          {
            v52 = (void *)MEMORY[0x1E0CB35C8];
            -[PHFaceCropChangeRequest originatingFaceUUID](self, "originatingFaceUUID");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "ph_genericErrorWithLocalizedDescription:", CFSTR("Unable to create face crops for originating face UUID %@ and person UUID %@"), v53, v32);
            v16 = (id)objc_claimAutoreleasedReturnValue();

          }
          v16 = objc_retainAutorelease(v16);
          v11 = 0;
          *v66 = v16;
        }
        else
        {
          v11 = 0;
        }
        v50 = 1;
LABEL_49:

        if ((v50 & 1) != 0)
          goto LABEL_12;
        goto LABEL_50;
      }
      v64 = v24;
      v40 = v23;
      v41 = v32;
      v42 = (void *)MEMORY[0x1E0D71720];
      -[PHChangeRequest uuid](self, "uuid");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[PHFaceCropChangeRequest resourceData](self, "resourceData");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "insertIntoPhotoLibrary:withUUID:resourceData:type:", v6, v43, v44, v36);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v11, "setAsset:", v64);
        v32 = v41;
        if ((_DWORD)v36 == 2)
        {
          v23 = v40;
          objc_msgSend(v40, "associatedPersonForFaceOrTorso:orTemporal:", 1, 0);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v67;
          objc_msgSend(v67, "invalidMergeCandidates");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = objc_msgSend(v47, "containsObject:", v45);

          if (v48)
          {
            objc_msgSend(v45, "personUUID");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setInvalidMergeCandidatePersonUUID:", v49);

          }
          v50 = 0;
          v24 = v64;
        }
        else
        {
          v50 = 0;
          v23 = v40;
          v24 = v64;
          v46 = v67;
        }
        goto LABEL_49;
      }
      PLPhotoKitGetLog();
      v38 = objc_claimAutoreleasedReturnValue();
      v32 = v41;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1991EC000, v38, OS_LOG_TYPE_ERROR, "Unable to insert face crop into photo library", buf, 2u);
      }
      v39 = CFSTR("Unable to insert face crop into photo library");
      v23 = v40;
      v24 = v64;
LABEL_42:

      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", v39);
      v51 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v51;
      goto LABEL_43;
    }
    objc_msgSend(v23, "rejectedPersons");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "containsObject:", v33);

    if ((v35 & 1) != 0)
    {
      v36 = 2;
      goto LABEL_33;
    }
    objc_msgSend(v23, "associatedPersonForFaceOrTorso:orTemporal:", 1, 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v37, "isEqual:", v33))
    {
      if (objc_msgSend(v37, "verifiedType") == 1)
      {
        if (objc_msgSend(v23, "nameSource") == 1)
        {
          v36 = 1;
          goto LABEL_28;
        }
        if (objc_msgSend(v23, "nameSource") == 3)
        {
          v36 = 3;
          goto LABEL_28;
        }
        v61 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v23, "namingDescription");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "pointerDescription");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "stringWithFormat:", CFSTR("Cannot create face crop for face %@ with invalid nameSource for user-verified person %@"), v62, v63);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        PLPhotoKitGetLog();
        v60 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
        {
LABEL_60:

          objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3300, CFSTR("%@"), v59);
          v65 = objc_claimAutoreleasedReturnValue();

          v36 = 0;
          v25 = 0;
          v16 = (id)v65;
LABEL_28:

          if ((_DWORD)v36)
            goto LABEL_33;
          goto LABEL_29;
        }
        *(_DWORD *)buf = 138412290;
        v70 = v59;
LABEL_59:
        _os_log_impl(&dword_1991EC000, v60, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        goto LABEL_60;
      }
      if (objc_msgSend(v37, "verifiedType") == 2)
      {
        if (objc_msgSend(v23, "nameSource") == 5)
        {
          v36 = 5;
          goto LABEL_28;
        }
        v56 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v23, "namingDescription");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "pointerDescription");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "stringWithFormat:", CFSTR("Cannot create face crop for face %@ with invalid nameSource for graph-verified person %@"), v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        PLPhotoKitGetLog();
        v60 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
          goto LABEL_60;
        *(_DWORD *)buf = 138412290;
        v70 = v59;
        goto LABEL_59;
      }
    }
    v36 = 0;
    goto LABEL_28;
  }
  v8 = (void *)MEMORY[0x1E0D71720];
  -[PHChangeRequest uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHFaceCropChangeRequest resourceData](self, "resourceData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "insertIntoPhotoLibrary:withUUID:resourceData:type:", v6, v9, v10, -[PHFaceCropChangeRequest type](self, "type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setState:", 0);
  -[PHFaceCropChangeRequest personHelper](self, "personHelper");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mutableObjectIDsAndUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (!v14)
  {

    v16 = 0;
    goto LABEL_50;
  }
  objc_msgSend(v12, "setAllowsInsert:", 1);
  objc_msgSend(v12, "setDestinationEntityName:", CFSTR("Person"));
  objc_msgSend(v12, "setDestinationUUIDKeyPath:", CFSTR("personUUID"));
  objc_msgSend(v12, "setIsDestinationObjectValid:", &__block_literal_global_14839);
  v68 = 0;
  v15 = objc_msgSend(v12, "applyMutationsToManagedObjectToOneRelationship:error:", v11, &v68);
  v16 = v68;

  if (!a4 || (v15 & 1) != 0)
  {
    if (!v15)
    {
LABEL_12:
      v19 = 0;
      goto LABEL_51;
    }
LABEL_50:
    v19 = v11;
    goto LABEL_51;
  }
  if (!v16)
  {
    v17 = (void *)MEMORY[0x1E0CB35C8];
    -[PHFaceCropChangeRequest originatingFaceCropUUID](self, "originatingFaceCropUUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "ph_genericErrorWithLocalizedDescription:", CFSTR("Unable to create face crops from originating face crop with UUID %@"), v18);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  v16 = objc_retainAutorelease(v16);
  v19 = 0;
  *a4 = v16;
LABEL_51:
  v54 = v19;

  return v54;
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
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  int v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  _BOOL4 v24;
  uint64_t v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  char v34;
  id v35;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;

  v8 = a3;
  v9 = a4;
  -[PHChangeRequest helper](self, "helper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  v11 = objc_msgSend(v10, "applyMutationsToManagedObject:error:", v8, &v42);
  v12 = v42;

  -[PHFaceCropChangeRequest faceHelper](self, "faceHelper");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v11)
  {
    objc_msgSend(v13, "mutableObjectIDsAndUUIDs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      v17 = v8;
      objc_msgSend(v17, "face");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setAllowsInsert:", 1);
      objc_msgSend(v14, "setDestinationEntityName:", CFSTR("DetectedFace"));
      objc_msgSend(v14, "setIsDestinationObjectValid:", &__block_literal_global_82);
      v41 = v12;
      v19 = objc_msgSend(v14, "applyMutationsToManagedObjectToOneRelationship:error:", v17, &v41);
      v39 = v41;

      if (v19)
      {
        v37 = v18;
        v20 = v17;
        objc_msgSend(v20, "face");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectID");
        v38 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "applyPropertiesToTrainingFace");
        objc_msgSend(v20, "face");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "trainingType");
        v24 = v23 != 0;

        if (!v23)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3300, CFSTR("Adding a training face to a face crop with 'None' type is invalid"));
          v25 = objc_claimAutoreleasedReturnValue();

          v39 = (id)v25;
        }
        v18 = v37;
        v26 = (void *)v38;
        if (v37)
        {
          if (v38)
          {
            objc_msgSend(v37, "objectID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "isEqual:", v38);

            v18 = v37;
            v26 = (void *)v38;
            if ((v28 & 1) == 0)
            {
              objc_msgSend(v9, "managedObjectContext");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "deleteObject:", v37);

              v18 = v37;
              v26 = (void *)v38;
            }
          }
        }

      }
      else
      {
        v24 = 0;
      }

      v12 = v39;
    }
    else
    {
      v24 = 1;
    }
  }
  else
  {
    v24 = 0;
  }

  -[PHFaceCropChangeRequest personHelper](self, "personHelper");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v24)
  {
    objc_msgSend(v30, "mutableObjectIDsAndUUIDs");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "count");

    if (!v33)
    {

      v34 = 1;
      goto LABEL_23;
    }
    objc_msgSend(v31, "setAllowsInsert:", 1);
    objc_msgSend(v31, "setDestinationEntityName:", CFSTR("Person"));
    objc_msgSend(v31, "setDestinationUUIDKeyPath:", CFSTR("personUUID"));
    objc_msgSend(v31, "setIsDestinationObjectValid:", &__block_literal_global_86);
    v40 = v12;
    v34 = objc_msgSend(v31, "applyMutationsToManagedObjectToOneRelationship:error:", v8, &v40);
    v35 = v40;

    v12 = v35;
  }
  else
  {
    v34 = 0;
  }

  if (a5 && (v34 & 1) == 0)
  {
    v12 = objc_retainAutorelease(v12);
    v34 = 0;
    *a5 = v12;
  }
LABEL_23:

  return v34;
}

- (NSString)originatingFaceUUID
{
  return self->_originatingFaceUUID;
}

- (void)setOriginatingFaceUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)originatingFaceCropUUID
{
  return self->_originatingFaceCropUUID;
}

- (void)setOriginatingFaceCropUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (PHRelationshipChangeRequestHelper)faceHelper
{
  return self->_faceHelper;
}

- (PHRelationshipChangeRequestHelper)personHelper
{
  return self->_personHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personHelper, 0);
  objc_storeStrong((id *)&self->_faceHelper, 0);
  objc_storeStrong((id *)&self->_originatingFaceCropUUID, 0);
  objc_storeStrong((id *)&self->_originatingFaceUUID, 0);
}

uint64_t __76__PHFaceCropChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke_85()
{
  return 1;
}

BOOL __76__PHFaceCropChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  objc_msgSend(a2, "associatedPersonForFaceOrTorso:orTemporal:", 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    PLPhotoKitGetLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_ERROR, "Setting a detected face which already has a person on a face crop is invalid", v5, 2u);
    }

  }
  return v2 == 0;
}

uint64_t __78__PHFaceCropChangeRequest_createManagedObjectForInsertIntoPhotoLibrary_error___block_invoke()
{
  return 1;
}

+ (id)changeRequestForFaceCrop:(id)a3
{
  return +[PHChangeRequestHelper changeRequestForObject:](PHChangeRequestHelper, "changeRequestForObject:", a3);
}

+ (id)creationRequestForFaceCropCopyFromFaceCrop:(id)a3 withType:(signed __int16)a4 onPerson:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForNewObject");
  objc_msgSend(v9, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setOriginatingFaceCropUUID:", v11);

  objc_msgSend(v9, "resourceData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setResourceData:", v12);
  objc_msgSend(v10, "setType:", v5);
  objc_msgSend(v10, "_mutablePersonObjectIDsAndUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PLObjectIDOrUUIDFromPHObject(v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObject:", v14);
  return v10;
}

+ (id)_creationRequestForFaceCropWithOriginatingFace:(id)a3 resourceData:(id)a4 personLocalIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initForNewObject");
  objc_msgSend(v11, "setResourceData:", v9);

  objc_msgSend(v10, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setOriginatingFaceUUID:", v12);
  objc_msgSend(v11, "_mutablePersonObjectIDsAndUUIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHObject uuidFromLocalIdentifier:](PHObject, "uuidFromLocalIdentifier:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addObject:", v14);
  return v11;
}

+ (id)_creationRequestForFaceCropWithOriginatingFace:(id)a3 resourceData:(id)a4 person:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  objc_msgSend(a5, "localIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_creationRequestForFaceCropWithOriginatingFace:resourceData:personLocalIdentifier:", v9, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)creationRequestsForFaceCropsWithOriginatingFace:(id)a3 resourceData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v23 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectContextForCurrentQueueQoS");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __88__PHFaceCropChangeRequest_creationRequestsForFaceCropsWithOriginatingFace_resourceData___block_invoke;
  v28[3] = &unk_1E35DFAF8;
  v10 = v6;
  v29 = v10;
  v30 = v9;
  v11 = v7;
  v31 = v11;
  v22 = v30;
  objc_msgSend(v30, "performBlockAndWait:", v28);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v25;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v13);
        +[PHObject localIdentifierWithUUID:](PHPerson, "localIdentifierWithUUID:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v17));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_creationRequestForFaceCropWithOriginatingFace:resourceData:personLocalIdentifier:", v10, v23, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v19);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v15);
  }

  +[PHFaceChangeRequest changeRequestForFace:](PHFaceChangeRequest, "changeRequestForFace:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setShouldClearFaceCropGenerationState:", 1);

  return v12;
}

+ (void)deleteFaceCrops:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:ofType:forSelector:](PHFaceCropDeleteRequest, "deleteRequestsForObjects:ofType:forSelector:", v5, objc_opt_class(), a2);

}

void __88__PHFaceCropChangeRequest_creationRequestsForFaceCropsWithOriginatingFace_resourceData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  _QWORD v29[4];

  v29[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  objc_msgSend(MEMORY[0x1E0D71940], "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0D71940];
  objc_msgSend(*(id *)(a1 + 32), "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateForPersonsNeedingFaceCropGenerationForFaceObjectID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  objc_msgSend(v4, "setResultType:", 2);
  v29[0] = CFSTR("personUUID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPropertiesToFetch:", v8);

  v9 = *(void **)(a1 + 40);
  v23 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v4, &v23);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v23;
  if (v10)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = v10;
    v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "objectForKey:", CFSTR("personUUID"), (_QWORD)v19);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v17);

        }
        v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v14);
    }
  }
  else
  {
    PLPhotoKitGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v26 = v18;
      v27 = 2112;
      v28 = v11;
      _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_ERROR, "Error fetching persons needing face crop generation for face %@, error %@", buf, 0x16u);
    }
  }

}

@end
