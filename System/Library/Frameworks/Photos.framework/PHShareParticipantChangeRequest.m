@implementation PHShareParticipantChangeRequest

- (id)initForNewObject
{
  PHShareParticipantChangeRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v5;
  PHRelationshipChangeRequestHelper *personHelper;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHShareParticipantChangeRequest;
  v2 = -[PHChangeRequest init](&v8, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

    v5 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("person"), v2->super._helper);
    personHelper = v2->_personHelper;
    v2->_personHelper = v5;

  }
  return v2;
}

- (PHShareParticipantChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHShareParticipantChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v11;
  PHRelationshipChangeRequestHelper *personHelper;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHShareParticipantChangeRequest;
  v8 = -[PHChangeRequest init](&v14, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

    v11 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:changeRequestHelper:", CFSTR("person"), v8->super._helper);
    personHelper = v8->_personHelper;
    v8->_personHelper = v11;

  }
  return v8;
}

- (PHShareParticipantChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHShareParticipantChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  PHRelationshipChangeRequestHelper *v14;
  PHRelationshipChangeRequestHelper *personHelper;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PHShareParticipantChangeRequest;
  v11 = -[PHChangeRequest init](&v17, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

    v14 = -[PHRelationshipChangeRequestHelper initWithRelationshipName:xpcDict:changeRequestHelper:]([PHRelationshipChangeRequestHelper alloc], "initWithRelationshipName:xpcDict:changeRequestHelper:", CFSTR("person"), v8, v11->super._helper);
    personHelper = v11->_personHelper;
    v11->_personHelper = v14;

  }
  return v11;
}

- (void)encodeToXPCDict:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PHChangeRequest helper](self, "helper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeToXPCDict:", v5);

  -[PHRelationshipChangeRequestHelper encodeToXPCDict:](self->_personHelper, "encodeToXPCDict:", v5);
}

- (BOOL)prepareForPhotoLibraryCheck:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "type") && objc_msgSend(v5, "type") != 1)
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x1E0CB35C8];
      v9 = *MEMORY[0x1E0CB2D50];
      v10[0] = CFSTR("Change must be performed within the sharedPhotoLibrary or sharedMomentSharePhotoLibrary");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v7);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }
  else
  {
    LOBYTE(a4) = 1;
  }

  return (char)a4;
}

- (NSString)managedEntityName
{
  return (NSString *)CFSTR("ShareParticipant");
}

- (PHObjectPlaceholder)placeholderForCreatedShareParticipant
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PHObjectPlaceholder *)v4;
}

- (NSString)emailAddress
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("emailAddress"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setEmailAddress:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("emailAddress"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("emailAddress"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("emailAddress"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("emailAddress"));
  }

}

- (NSString)phoneNumber
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("phoneNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setPhoneNumber:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("phoneNumber"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("phoneNumber"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("phoneNumber"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("phoneNumber"));
  }

}

- (unsigned)role
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("role"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (unsigned __int16)v3;
}

- (void)setRole:(unsigned __int16)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("role"));

}

- (signed)permission
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("permission"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v3) = objc_msgSend(v5, "intValue");
  return (__int16)v3;
}

- (void)setPermission:(signed __int16)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("permission"));

}

- (BOOL)isCurrentUser
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("isCurrentUser"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setIsCurrentUser:(BOOL)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("isCurrentUser"));

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

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0D71B08], "insertInPhotoLibrary:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHShareParticipantChangeRequest emailAddress](self, "emailAddress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEmailAddress:", v7);

  -[PHShareParticipantChangeRequest phoneNumber](self, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPhoneNumber:", v8);

  -[PHChangeRequest uuid](self, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUuid:", v9);

  v10 = -[PHShareParticipantChangeRequest role](self, "role");
  if ((v10 - 1) < 3)
    v11 = (unsigned __int16)(v10 - 1) + 1;
  else
    v11 = 0;
  objc_msgSend(v6, "setRole:", v11);
  if (a4 && !v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (void)_preparePersonIDIfNeeded
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

- (id)_mutablePersonObjectIDsAndUUIDs
{
  void *v3;
  void *v4;

  -[PHShareParticipantChangeRequest _preparePersonIDIfNeeded](self, "_preparePersonIDIfNeeded");
  -[PHShareParticipantChangeRequest personHelper](self, "personHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutableObjectIDsAndUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  if (v4)
  {
    v10 = v4;
    -[PHChangeRequest didMutate](self, "didMutate");
    PLObjectIDOrUUIDFromPHObject(v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v10;
    if (v5)
    {
      -[PHShareParticipantChangeRequest _mutablePersonObjectIDsAndUUIDs](self, "_mutablePersonObjectIDsAndUUIDs");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");

      -[PHShareParticipantChangeRequest _mutablePersonObjectIDsAndUUIDs](self, "_mutablePersonObjectIDsAndUUIDs");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7)
        objc_msgSend(v8, "replaceObjectAtIndex:withObject:", 0, v5);
      else
        objc_msgSend(v8, "addObject:", v5);

      v4 = v10;
    }
  }

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
  uint64_t v14;
  void *v15;
  char v16;
  id v17;
  id v19;
  id v20;

  v7 = a3;
  -[PHChangeRequest helper](self, "helper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v9 = objc_msgSend(v8, "applyMutationsToManagedObject:error:", v7, &v20);
  v10 = v20;

  -[PHShareParticipantChangeRequest personHelper](self, "personHelper");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v9)
  {
    objc_msgSend(v11, "mutableObjectIDsAndUUIDs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (!v14)
    {
      v16 = 1;
      goto LABEL_9;
    }
    objc_msgSend(v12, "setAllowsInsert:", 1);
    objc_msgSend(MEMORY[0x1E0D71940], "entityName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDestinationEntityName:", v15);

    objc_msgSend(v12, "setIsDestinationObjectValid:", &__block_literal_global_27189);
    v19 = v10;
    v16 = objc_msgSend(v12, "applyMutationsToManagedObjectToOneRelationship:error:", v7, &v19);
    v17 = v19;

    v10 = v17;
    if (!a5)
      goto LABEL_9;
  }
  else
  {
    v16 = 0;
    if (!a5)
      goto LABEL_9;
  }
  if ((v16 & 1) == 0)
  {
    v10 = objc_retainAutorelease(v10);
    v16 = 0;
    *a5 = v10;
  }
LABEL_9:

  return v16;
}

- (PHRelationshipChangeRequestHelper)personHelper
{
  return self->_personHelper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personHelper, 0);
}

uint64_t __84__PHShareParticipantChangeRequest_applyMutationsToManagedObject_photoLibrary_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isValidForPersistence") ^ 1;
}

+ (id)changeRequestForShareParticipant:(id)a3
{
  return +[PHChangeRequestHelper changeRequestForObject:](PHChangeRequestHelper, "changeRequestForObject:", a3);
}

+ (id)creationRequestForShareParticipantWithEmailAddress:(id)a3 permission:(signed __int16)a4
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = a4;
  v5 = a3;
  v6 = -[PHShareParticipantChangeRequest initForNewObject]([PHShareParticipantChangeRequest alloc], "initForNewObject");
  objc_msgSend(v6, "setEmailAddress:", v5);

  objc_msgSend(v6, "setPermission:", v4);
  return v6;
}

+ (id)creationRequestForShareParticipantWithPhoneNumber:(id)a3 permission:(signed __int16)a4
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = a4;
  v5 = a3;
  v6 = -[PHShareParticipantChangeRequest initForNewObject]([PHShareParticipantChangeRequest alloc], "initForNewObject");
  objc_msgSend(v6, "setPhoneNumber:", v5);

  objc_msgSend(v6, "setPermission:", v4);
  return v6;
}

+ (void)deleteShareParticipants:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:ofType:forSelector:](PHShareParticipantDeleteRequest, "deleteRequestsForObjects:ofType:forSelector:", v5, objc_opt_class(), a2);

}

@end
