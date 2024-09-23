@implementation PHSocialGroupChangeRequest

- (PHSocialGroupChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHSocialGroupChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  _BOOL4 v14;
  uint64_t v15;
  NSString *customTitle;
  _BOOL4 v17;
  _BOOL4 v18;
  uint64_t v19;
  NSSet *initialMemberPersonIDs;
  _BOOL4 v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSManagedObjectID *keyAssetID;
  objc_super v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)PHSocialGroupChangeRequest;
  v11 = -[PHChangeRequest init](&v28, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

    v11->_userAction = xpc_dictionary_get_BOOL(v8, "userAction");
    v14 = xpc_dictionary_get_BOOL(v8, "didSetCustomTitle");
    v11->_didSetCustomTitle = v14;
    if (v14)
    {
      PLStringFromXPCDictionary();
      v15 = objc_claimAutoreleasedReturnValue();
      customTitle = v11->_customTitle;
      v11->_customTitle = (NSString *)v15;

      -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
      objc_msgSend(v9, "recordUpdateRequest:", v11);
    }
    v17 = xpc_dictionary_get_BOOL(v8, "didRejectSocialGroup");
    v11->_didRejectSocialGroup = v17;
    if (v17)
    {
      -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
      objc_msgSend(v9, "recordUpdateRequest:", v11);
    }
    v18 = xpc_dictionary_get_BOOL(v8, "didUnrejectSocialGroup");
    v11->_didUnrejectSocialGroup = v18;
    if (v18)
    {
      -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
      objc_msgSend(v9, "recordUpdateRequest:", v11);
    }
    -[PHSocialGroupChangeRequest _personIDsFromXPCDict:key:request:](v11, "_personIDsFromXPCDict:key:request:", v8, "memberPersonIDs", v9);
    v19 = objc_claimAutoreleasedReturnValue();
    initialMemberPersonIDs = v11->_initialMemberPersonIDs;
    v11->_initialMemberPersonIDs = (NSSet *)v19;

    v21 = xpc_dictionary_get_BOOL(v8, "didSetAutomaticOrder");
    v11->_didSetAutomaticOrder = v21;
    if (v21)
    {
      v11->_automaticOrder = xpc_dictionary_get_int64(v8, "automaticOrder");
      -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
      objc_msgSend(v9, "recordUpdateRequest:", v11);
    }
    v22 = xpc_dictionary_get_BOOL(v8, "didSetManualOrder");
    v11->_didSetManualOrder = v22;
    if (v22)
    {
      v11->_manualOrder = xpc_dictionary_get_int64(v8, "manualOrder");
      -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
      objc_msgSend(v9, "recordUpdateRequest:", v11);
    }
    xpc_dictionary_get_value(v8, "keyAssetID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v9, "persistentStoreCoordinator");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      PLManagedObjectIDFromXPCValue();
      v25 = objc_claimAutoreleasedReturnValue();
      keyAssetID = v11->_keyAssetID;
      v11->_keyAssetID = (NSManagedObjectID *)v25;

      -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
      objc_msgSend(v9, "recordUpdateRequest:", v11);
    }

  }
  return v11;
}

- (id)_personIDsFromXPCDict:(id)a3 key:(const char *)a4 request:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;

  v8 = a5;
  xpc_dictionary_get_value(a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v8, "persistentStoreCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __64__PHSocialGroupChangeRequest__personIDsFromXPCDict_key_request___block_invoke;
    v20 = &unk_1E35DEE78;
    v21 = v11;
    v22 = v10;
    v12 = v10;
    v13 = v11;
    xpc_array_apply(v9, &v17);
    -[PHChangeRequest helper](self, "helper", v17, v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setMutated:", 1);

    objc_msgSend(v8, "recordUpdateRequest:", self);
    v15 = (void *)objc_msgSend(v12, "copy");

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)initForNewObject
{
  PHSocialGroupChangeRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHSocialGroupChangeRequest;
  v2 = -[PHChangeRequest init](&v6, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

  }
  return v2;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  void *v5;
  xpc_object_t v6;
  NSSet *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeToXPCDict:", v4);

  xpc_dictionary_set_BOOL(v4, "userAction", self->_userAction);
  xpc_dictionary_set_BOOL(v4, "didSetCustomTitle", self->_didSetCustomTitle);
  if (self->_didSetCustomTitle)
    PLXPCDictionarySetString();
  xpc_dictionary_set_BOOL(v4, "didRejectSocialGroup", self->_didRejectSocialGroup);
  xpc_dictionary_set_BOOL(v4, "didUnrejectSocialGroup", self->_didUnrejectSocialGroup);
  if (-[NSSet count](self->_initialMemberPersonIDs, "count"))
  {
    v6 = xpc_array_create(0, 0);
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = self->_initialMemberPersonIDs;
    v8 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          PLXPCArrayAppendManagedObjectID();
          ++v11;
        }
        while (v9 != v11);
        v9 = -[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    xpc_dictionary_set_value(v4, "memberPersonIDs", v6);
  }
  xpc_dictionary_set_BOOL(v4, "didSetAutomaticOrder", self->_didSetAutomaticOrder);
  if (self->_didSetAutomaticOrder)
    xpc_dictionary_set_int64(v4, "automaticOrder", self->_automaticOrder);
  xpc_dictionary_set_BOOL(v4, "didSetManualOrder", self->_didSetManualOrder);
  if (self->_didSetManualOrder)
    xpc_dictionary_set_int64(v4, "manualOrder", self->_manualOrder);
  if (self->_keyAssetID)
    PLXPCDictionarySetManagedObjectID();

}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSSet *initialMemberPersonIDs;
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
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  initialMemberPersonIDs = self->_initialMemberPersonIDs;
  objc_msgSend(v6, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_findNonUserVerifiedGroupUUIDWithMembers:context:changesError:", initialMemberPersonIDs, v10, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if ((objc_msgSend(v11, "isEqualToString:", &stru_1E35DFFF8) & 1) != 0
      || !-[PHSocialGroupChangeRequest isUserAction](self, "isUserAction"))
    {
      v12 = (void *)objc_msgSend(MEMORY[0x1E0D71B28], "newNodeContainerWithManagedObjectContext:", v7);
      -[PHChangeRequest uuid](self, "uuid");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUuid:", v17);

      objc_msgSend(v12, "sourceNode");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D71788], "fetchRequest");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("uuid"), v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setPredicate:", v13);

      objc_msgSend(v6, "managedObjectContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "executeFetchRequest:error:", v12, a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v30 = v16;
        _os_log_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Found duplicate rejected/graph/unverified group %{public}@ (and no duplicate user groups) so not inserting new one.", buf, 0xCu);
      }
    }

  }
  else
  {
    v16 = 0;
  }
  -[PHChangeRequest uuid](self, "uuid");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "uuid");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqualToString:", v19);

  if ((v20 & 1) == 0)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0D74498];
    v27 = *MEMORY[0x1E0CB2938];
    v28 = CFSTR("Social group placeholder UUID doesn't match object created for creation request");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 46502, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (a4)
      *a4 = objc_retainAutorelease(v24);

    v16 = 0;
  }

  return v16;
}

- (id)placeholderForCreatedSocialGroup
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PHSocialGroupChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHSocialGroupChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHSocialGroupChangeRequest;
  v8 = -[PHChangeRequest init](&v12, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

  }
  return v8;
}

- (PHSocialGroupChangeRequest)initWithUUID:(id)a3
{
  id v4;
  PHSocialGroupChangeRequest *v5;
  PHChangeRequestHelper *v6;
  PHChangeRequestHelper *helper;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHSocialGroupChangeRequest;
  v5 = -[PHChangeRequest init](&v9, sel_init);
  if (v5)
  {
    v6 = -[PHChangeRequestHelper initForNewObjectWithUUID:changeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithUUID:changeRequest:", v4, v5);
    helper = v5->super._helper;
    v5->super._helper = v6;

  }
  return v5;
}

- (BOOL)allowMutationToManagedObject:(id)a3 propertyKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  id v14;

  v8 = a4;
  v9 = a3;
  -[PHChangeRequest helper](self, "helper");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v11 = objc_msgSend(v10, "allowMutationToManagedObject:propertyKey:error:", v9, v8, &v14);

  v12 = v14;
  if (a5 && (v11 & 1) == 0)
    *a5 = objc_retainAutorelease(v12);

  return v11;
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
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  _BOOL4 v18;
  BOOL v19;
  id v20;
  _BOOL4 v21;
  id v22;
  _BOOL4 v23;
  _BOOL4 v24;
  BOOL v25;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[PHChangeRequest helper](self, "helper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  v9 = objc_msgSend(v8, "applyMutationsToManagedObject:error:", v7, &v32);
  v10 = v32;

  if (v9)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0D71790], "newNodeContainerWithNode:", v7);
    objc_msgSend(v11, "members");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB2938];
      v34[0] = CFSTR("Error fetching social group members");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v14);
      v15 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v15;
    }
    v16 = objc_msgSend(v12, "count");
    if (v12)
      v17 = v16 == 0;
    else
      v17 = 1;
    v18 = !v17;
    if (v16)
      v19 = 1;
    else
      v19 = v12 == 0;
    if (!v19)
    {
      v31 = v10;
      v18 = -[PHSocialGroupChangeRequest _applyInitialMembersToContainer:error:](self, "_applyInitialMembersToContainer:error:", v11, &v31);
      v20 = v31;

      v10 = v20;
    }
    if (self->_didSetCustomTitle)
      objc_msgSend(v11, "setCustomTitle:", self->_customTitle);
    if (v18)
    {
      v30 = v10;
      v21 = -[PHSocialGroupChangeRequest _applyAutomaticOrderToContainer:error:](self, "_applyAutomaticOrderToContainer:error:", v11, &v30);
      v22 = v30;

      if (!v21)
      {
LABEL_25:
        v25 = 0;
        v10 = v22;
LABEL_26:

        if (!a5)
          goto LABEL_29;
        goto LABEL_27;
      }
      v29 = v22;
      v23 = -[PHSocialGroupChangeRequest _applyManualOrderToContainer:error:](self, "_applyManualOrderToContainer:error:", v11, &v29);
      v10 = v29;

      if (v23)
      {
        v28 = v10;
        v24 = -[PHSocialGroupChangeRequest _applyKeyAssetToContainer:managedObject:error:](self, "_applyKeyAssetToContainer:managedObject:error:", v11, v7, &v28);
        v22 = v28;

        if (v24)
        {
          v27 = v22;
          v25 = -[PHSocialGroupChangeRequest _applyVerifiedTypeToContainer:error:](self, "_applyVerifiedTypeToContainer:error:", v11, &v27);
          v10 = v27;

          goto LABEL_26;
        }
        goto LABEL_25;
      }
    }
    v25 = 0;
    goto LABEL_26;
  }
  v25 = 0;
  if (!a5)
    goto LABEL_29;
LABEL_27:
  if (!v25)
    *a5 = objc_retainAutorelease(v10);
LABEL_29:

  return v25;
}

- (BOOL)_applyVerifiedTypeToContainer:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  BOOL v12;
  void *v13;
  char v14;
  void *v16;
  void *v17;
  id v18;
  void *v19;

  v7 = a3;
  v8 = v7;
  if (!self->_didRejectSocialGroup)
  {
    if (!self->_userAction)
    {
      if (!self->_didUnrejectSocialGroup)
      {
        if (objc_msgSend(v7, "socialGroupVerifiedType"))
        {
          v11 = 0;
          goto LABEL_6;
        }
        v17 = 0;
        v9 = objc_msgSend(v8, "setSocialGroupVerifiedType:error:", 2, &v17);
        v10 = v17;
        goto LABEL_5;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSocialGroupChangeRequest.m"), 391, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_userAction"));

    }
    v18 = 0;
    v12 = 1;
    v14 = objc_msgSend(v8, "setSocialGroupVerifiedType:error:", 1, &v18);
    v11 = v18;
    if ((v14 & 1) != 0)
      goto LABEL_14;
    goto LABEL_11;
  }
  if (!self->_userAction)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSocialGroupChangeRequest.m"), 388, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_userAction"));

  }
  v19 = 0;
  v9 = objc_msgSend(v8, "setSocialGroupVerifiedType:error:", 0xFFFFFFFFLL, &v19);
  v10 = v19;
LABEL_5:
  v11 = v10;
  if ((v9 & 1) != 0)
  {
LABEL_6:
    v12 = 1;
    goto LABEL_14;
  }
LABEL_11:
  if (a4)
  {
    v11 = objc_retainAutorelease(v11);
    v12 = 0;
    *a4 = v11;
  }
  else
  {
    v12 = 0;
  }
LABEL_14:

  return v12;
}

- (BOOL)_applyKeyAssetToContainer:(id)a3 managedObject:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  char v15;
  id v16;
  int v17;
  char v18;
  id v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  char v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (self->_keyAssetID)
  {
    if (objc_msgSend(v9, "keyAssetPickSource") == -1)
    {
      v22 = (void *)MEMORY[0x1E0CB35C8];
      v51 = *MEMORY[0x1E0CB2938];
      v52[0] = CFSTR("Error fetching social group key-asset edge for pick source");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (a5)
        *a5 = objc_retainAutorelease(v24);

      goto LABEL_34;
    }
    if (!self->_userAction)
    {
      if (objc_msgSend(v9, "keyAssetPickSource"))
      {
        objc_msgSend(v9, "keyAsset");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          v27 = (void *)MEMORY[0x1E0CB35C8];
          v47 = *MEMORY[0x1E0CB2938];
          v48 = CFSTR("Only the user may override a visible, user-picked-key asset");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 7409, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v29;
          if (a5)
            *a5 = objc_retainAutorelease(v29);

          v17 = 0;
          goto LABEL_33;
        }
      }
    }
    objc_msgSend(v10, "managedObjectContext");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "objectWithID:", self->_keyAssetID);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v42)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSocialGroupChangeRequest.m"), 412, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("keyAsset != nil"));

    }
    v41 = (void *)objc_msgSend(MEMORY[0x1E0D71B28], "newNodeContainerWithNode:", v10);
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71B30]), "initWithSocialGroup:", v41);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_keyAssetID);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(v11, "assetIDsIncludedInExclusiveContainment:error:", v12, &v46);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v46;

    if (!v13)
      goto LABEL_22;
    if (objc_msgSend(v13, "containsObject:", self->_keyAssetID))
    {
      v45 = v14;
      v15 = objc_msgSend(v9, "setKeyAsset:error:", v42, &v45);
      v16 = v45;

      if ((v15 & 1) != 0)
      {
        if (self->_userAction)
        {
          v44 = v16;
          v17 = 1;
          v18 = objc_msgSend(v9, "setKeyAssetPickSource:error:", 1, &v44);
          v19 = v44;

          v14 = v19;
          v20 = v40;
          if ((v18 & 1) != 0)
            goto LABEL_43;
        }
        else
        {
          v43 = v16;
          v37 = objc_msgSend(v9, "setKeyAssetPickSource:error:", 0, &v43);
          v38 = v43;

          v14 = v38;
          if ((v37 & 1) != 0)
          {
            v17 = 1;
            v20 = v40;
LABEL_43:

            v31 = 1;
LABEL_32:

            if ((v31 & 1) != 0)
            {
LABEL_33:
              v21 = v17 != 0;
              goto LABEL_35;
            }
LABEL_34:
            v21 = 0;
            goto LABEL_35;
          }
          v20 = v40;
        }
        if (a5)
        {
          v14 = objc_retainAutorelease(v14);
          v17 = 0;
          *a5 = v14;
        }
        else
        {
          v17 = 0;
        }
        goto LABEL_43;
      }
      if (a5)
      {
        v14 = objc_retainAutorelease(v16);
        v31 = 0;
        *a5 = v14;
        v17 = 1;
      }
      else
      {
        v31 = 0;
        v17 = 1;
        v14 = v16;
      }
LABEL_31:
      v20 = v40;
      goto LABEL_32;
    }
    if ((objc_msgSend(v13, "containsObject:", self->_keyAssetID) & 1) == 0)
    {
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v49 = *MEMORY[0x1E0CB2938];
      v50 = CFSTR("The key asset must exist in the social group");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 7402, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v34;
      if (a5)
        *a5 = objc_retainAutorelease(v34);

    }
    else
    {
LABEL_22:
      if (a5)
      {
        v14 = objc_retainAutorelease(v14);
        v17 = 0;
        *a5 = v14;
LABEL_30:
        v31 = 1;
        goto LABEL_31;
      }
    }
    v17 = 0;
    goto LABEL_30;
  }
  v21 = 1;
LABEL_35:

  return v21;
}

- (BOOL)_applyAutomaticOrderToContainer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_didSetAutomaticOrder)
    goto LABEL_4;
  if ((self->_automaticOrder & 0x8000000000000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAutomaticOrder:", v7);

LABEL_4:
    v8 = 1;
    goto LABEL_8;
  }
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v14 = *MEMORY[0x1E0CB2938];
  v15[0] = CFSTR("The automatic order must be nonnegative");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 7403, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)_applyManualOrderToContainer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_didSetManualOrder)
    goto LABEL_4;
  if ((self->_manualOrder & 0x8000000000000000) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setManualOrder:", v7);

LABEL_4:
    v8 = 1;
    goto LABEL_8;
  }
  v9 = (void *)MEMORY[0x1E0CB35C8];
  v14 = *MEMORY[0x1E0CB2938];
  v15[0] = CFSTR("The manual order must be nonnegative");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 7403, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a4)
    *a4 = objc_retainAutorelease(v11);

  v8 = 0;
LABEL_8:

  return v8;
}

- (BOOL)_applyInitialMembersToContainer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSSet *initialMemberPersonIDs;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (-[NSSet count](self->_initialMemberPersonIDs, "count") <= 1)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CB2938];
    v29[0] = CFSTR("Social groups must have at least two members");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 7404, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (a4)
      *a4 = objc_retainAutorelease(v9);
LABEL_9:

    goto LABEL_10;
  }
  v11 = (void *)MEMORY[0x1E0D71B28];
  initialMemberPersonIDs = self->_initialMemberPersonIDs;
  objc_msgSend(v6, "sourceNode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fetchDuplicateSocialGroupIDsWithMemberIDs:inContext:error:", initialMemberPersonIDs, v14, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (!objc_msgSend(v8, "count"))
    {
      v20 = (void *)MEMORY[0x1E0D71940];
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self in %@"), self->_initialMemberPersonIDs);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "sourceNode");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "managedObjectContext");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "personsMatchingPredicate:fetchLimit:sortDescriptors:relationshipKeyPathsForPrefetching:inManagedObjectContext:", v21, 0, 0, 0, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v6, "setMembers:error:", v25, a4);

      goto LABEL_11;
    }
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CB2938];
    v27 = CFSTR("Each social group must have distinct members");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 7401, v10);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (a4)
      *a4 = objc_retainAutorelease(v16);

    goto LABEL_9;
  }
LABEL_10:
  v18 = 0;
LABEL_11:

  return v18;
}

- (NSString)managedEntityName
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D71788], "entityName");
}

- (void)setCustomTitle:(id)a3
{
  NSString *v5;
  void *v6;
  NSString *customTitle;
  void *v8;

  v5 = (NSString *)a3;
  if (!self->_userAction)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSocialGroupChangeRequest.m"), 497, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_userAction"));

  }
  -[PHChangeRequest helper](self, "helper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didMutate");

  customTitle = self->_customTitle;
  self->_customTitle = v5;

  self->_didSetCustomTitle = 1;
}

- (void)_setMembers:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSSet *v13;
  NSSet *initialMemberPersonIDs;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11), "objectID", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  v13 = (NSSet *)objc_msgSend(v6, "copy");
  initialMemberPersonIDs = self->_initialMemberPersonIDs;
  self->_initialMemberPersonIDs = v13;

}

- (void)rejectSocialGroup
{
  void *v3;
  void *v5;

  if (!self->_userAction)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSocialGroupChangeRequest.m"), 516, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_userAction"));

  }
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didMutate");

  self->_didRejectSocialGroup = 1;
}

- (void)unrejectSocialGroup
{
  void *v3;
  void *v5;

  if (!self->_userAction)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHSocialGroupChangeRequest.m"), 522, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_userAction"));

  }
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didMutate");

  self->_didUnrejectSocialGroup = 1;
}

- (void)resetCustomTitle
{
  void *v3;
  NSString *customTitle;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didMutate");

  self->_didSetCustomTitle = 1;
  customTitle = self->_customTitle;
  self->_customTitle = 0;

}

- (void)setOrder:(int64_t)a3
{
  void *v5;
  int *v6;
  int *v7;

  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  if (self->_userAction)
    v6 = &OBJC_IVAR___PHSocialGroupChangeRequest__didSetManualOrder;
  else
    v6 = &OBJC_IVAR___PHSocialGroupChangeRequest__didSetAutomaticOrder;
  v7 = &OBJC_IVAR___PHSocialGroupChangeRequest__manualOrder;
  if (!self->_userAction)
    v7 = &OBJC_IVAR___PHSocialGroupChangeRequest__automaticOrder;
  *((_BYTE *)&self->super.super.isa + *v6) = 1;
  *(Class *)((char *)&self->super.super.isa + *v7) = (Class)a3;
}

- (void)setKeyAsset:(id)a3
{
  id v4;
  void *v5;
  NSManagedObjectID *v6;
  NSManagedObjectID *keyAssetID;

  v4 = a3;
  -[PHChangeRequest helper](self, "helper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didMutate");

  objc_msgSend(v4, "objectID");
  v6 = (NSManagedObjectID *)objc_claimAutoreleasedReturnValue();

  keyAssetID = self->_keyAssetID;
  self->_keyAssetID = v6;

}

- (id)initialMemberPersonIDs
{
  NSSet *initialMemberPersonIDs;

  initialMemberPersonIDs = self->_initialMemberPersonIDs;
  if (initialMemberPersonIDs)
    return initialMemberPersonIDs;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isUserAction
{
  return self->_userAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetID, 0);
  objc_storeStrong((id *)&self->_initialMemberPersonIDs, 0);
  objc_storeStrong((id *)&self->_customTitle, 0);
}

uint64_t __64__PHSocialGroupChangeRequest__personIDsFromXPCDict_key_request___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;

  PLManagedObjectIDFromXPCValue();
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    +[PHPhotoLibrary uniquedOID:](PHPhotoLibrary, "uniquedOID:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

    }
  }
  return 1;
}

+ (id)_creationRequestForSocialGroupCopyWithUUID:(id)a3
{
  id v3;
  PHSocialGroupChangeRequest *v4;

  v3 = a3;
  v4 = -[PHSocialGroupChangeRequest initWithUUID:]([PHSocialGroupChangeRequest alloc], "initWithUUID:", v3);

  v4->_userAction = 1;
  -[PHSocialGroupChangeRequest unrejectSocialGroup](v4, "unrejectSocialGroup");
  return v4;
}

+ (id)creationRequestForSocialGroupWithMembers:(id)a3 userAction:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _BYTE *v17;
  id v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  _QWORD *v26;
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  _QWORD v34[5];
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  uint64_t v41;
  _BYTE v42[128];
  uint64_t v43;

  v4 = a4;
  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v37 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "objectID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    }
    while (v9);
  }

  if (!v4)
    goto LABEL_13;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__40723;
  v34[4] = __Block_byref_object_dispose__40724;
  v35 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__40723;
  v32 = __Block_byref_object_dispose__40724;
  v33 = 0;
  +[PHPhotoLibrary photoLibraryForCurrentTransaction](PHPhotoLibrary, "photoLibraryForCurrentTransaction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__PHSocialGroupChangeRequest_creationRequestForSocialGroupWithMembers_userAction___block_invoke;
  v22[3] = &unk_1E35DEEA0;
  v25 = &v28;
  v27 = a1;
  v23 = v7;
  v15 = v14;
  v24 = v15;
  v26 = v34;
  objc_msgSend(v15, "performBlockAndWait:", v22);
  v16 = (void *)v29[5];
  if (!v16)
    goto LABEL_11;
  if ((objc_msgSend(v16, "isEqualToString:", &stru_1E35DFFF8) & 1) == 0)
  {
    v19 = objc_alloc(MEMORY[0x1E0CB3A28]);
    v20 = (void *)objc_msgSend(v19, "initWithUUIDString:", v29[5]);
    objc_msgSend(a1, "_creationRequestForSocialGroupCopyWithUUID:", v20);
    v17 = (_BYTE *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v29[5];
      *(_DWORD *)buf = 138543362;
      v41 = v21;
      _os_log_impl(&dword_1991EC000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Found duplicate rejected/graph/unverified group %{public}@ (and no duplicate user groups) so using creation request for existing group.", buf, 0xCu);
    }
  }
  else
  {
LABEL_11:
    v17 = 0;
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v34, 8);

  if (!v17)
  {
LABEL_13:
    v17 = -[PHSocialGroupChangeRequest initForNewObject]([PHSocialGroupChangeRequest alloc], "initForNewObject");
    v17[32] = v4;
  }
  objc_msgSend(v17, "_setMembers:", v8);

  return v17;
}

+ (id)changeRequestForSocialGroup:(id)a3 userAction:(BOOL)a4
{
  id v5;
  PHSocialGroupChangeRequest *v6;
  void *v7;
  void *v8;
  PHSocialGroupChangeRequest *v9;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = [PHSocialGroupChangeRequest alloc];
    objc_msgSend(v5, "uuid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PHSocialGroupChangeRequest initWithUUID:objectID:](v6, "initWithUUID:objectID:", v7, v8);

    v9->_userAction = a4;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_findNonUserVerifiedGroupUUIDWithMembers:(id)a3 context:(id)a4 changesError:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  __CFString *v17;
  id v18;
  __CFString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  id v27;
  id v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v17 = &stru_1E35DFFF8;
LABEL_18:
    v17 = v17;
    v19 = v17;
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0D71B28], "fetchDuplicateSocialGroupIDsWithMemberIDs:inContext:error:", v7, v8, a5);
  v9 = objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v19 = 0;
    v17 = &stru_1E35DFFF8;
    goto LABEL_19;
  }
  v10 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0D71798], "fetchRequest");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K IN %@) AND (%K = %@) AND (%K = %d)"), CFSTR("node"), v10, CFSTR("valueName"), CFSTR("socialGroupVerifiedType"), CFSTR("intValue"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredicate:", v12);

  objc_msgSend(v11, "setResultType:", 1);
  v28 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v11, &v28);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v28;
  v15 = v14;
  if (!v13)
  {
    if (a5)
    {
      v18 = objc_retainAutorelease(v14);
      v16 = 0;
      v19 = 0;
      *a5 = v18;
      goto LABEL_16;
    }
    v16 = 0;
    v19 = 0;
LABEL_15:
    v18 = v15;
    goto LABEL_16;
  }
  if (objc_msgSend(v13, "count"))
  {
    v16 = 0;
    v17 = &stru_1E35DFFF8;
    v18 = v15;
    v19 = &stru_1E35DFFF8;
    goto LABEL_17;
  }
  if (!objc_msgSend(v10, "count"))
  {
    v19 = 0;
    v16 = 1;
    goto LABEL_15;
  }
  objc_msgSend(v10, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71788], "fetchRequest");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setResultType:", 2);
  v29[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPropertiesToFetch:", v21);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self = %@"), v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setPredicate:", v22);

  v27 = v15;
  objc_msgSend(v8, "executeFetchRequest:error:", v20, &v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v27;

  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("uuid"));
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v19 = 0;
    v16 = 1;
    goto LABEL_17;
  }
  if (a5)
    *a5 = objc_retainAutorelease(v18);

  v16 = 0;
  v19 = 0;
LABEL_16:
  v17 = &stru_1E35DFFF8;
LABEL_17:

  if (v16)
    goto LABEL_18;
LABEL_19:

  return v19;
}

+ (void)deleteSocialGroups:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  v4 = +[PHObjectDeleteRequest deleteRequestsForObjects:ofType:forSelector:](PHSocialGroupDeleteRequest, "deleteRequestsForObjects:ofType:forSelector:", v5, objc_opt_class(), a2);

}

void __82__PHSocialGroupChangeRequest_creationRequestForSocialGroupWithMembers_userAction___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id obj;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = a1[5];
  v4 = (void *)a1[8];
  v5 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v5 + 40);
  objc_msgSend(v4, "_findNonUserVerifiedGroupUUIDWithMembers:context:changesError:", v2, v3, &obj);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v5 + 40), obj);
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "creationRequestForSocialGroupWithMembers: error fetching social group nodes: %@", buf, 0xCu);
    }

  }
}

@end
