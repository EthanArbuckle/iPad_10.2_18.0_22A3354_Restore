@implementation PHCloudSharedAlbumChangeRequest

- (id)initForNewObject
{
  PHCloudSharedAlbumChangeRequest *v2;
  PHChangeRequestHelper *v3;
  PHChangeRequestHelper *helper;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHCloudSharedAlbumChangeRequest;
  v2 = -[PHChangeRequest init](&v6, sel_init);
  if (v2)
  {
    v3 = -[PHChangeRequestHelper initForNewObjectWithChangeRequest:]([PHChangeRequestHelper alloc], "initForNewObjectWithChangeRequest:", v2);
    helper = v2->super._helper;
    v2->super._helper = v3;

  }
  return v2;
}

- (PHCloudSharedAlbumChangeRequest)initWithUUID:(id)a3 objectID:(id)a4
{
  id v6;
  id v7;
  PHCloudSharedAlbumChangeRequest *v8;
  PHChangeRequestHelper *v9;
  PHChangeRequestHelper *helper;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PHCloudSharedAlbumChangeRequest;
  v8 = -[PHChangeRequest init](&v12, sel_init);
  if (v8)
  {
    v9 = -[PHChangeRequestHelper initWithUUID:objectID:changeRequest:]([PHChangeRequestHelper alloc], "initWithUUID:objectID:changeRequest:", v6, v7, v8);
    helper = v8->super._helper;
    v8->super._helper = v9;

  }
  return v8;
}

- (id)placeholderForCreatedCloudSharedAlbum
{
  void *v3;
  void *v4;

  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placeholderForCreatedObjectWithClass:changeRequest:", objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PHCloudSharedAlbumChangeRequest)initWithXPCDict:(id)a3 request:(id)a4 clientAuthorization:(id)a5
{
  id v8;
  id v9;
  id v10;
  PHCloudSharedAlbumChangeRequest *v11;
  PHChangeRequestHelper *v12;
  PHChangeRequestHelper *helper;
  void *v14;
  uint64_t v15;
  NSMutableArray *invitationRecordGUIDsToRemove;
  void *v17;
  uint64_t v18;
  NSMutableArray *pendingInvitationRecordGUIDs;
  void *v20;
  uint64_t v21;
  NSMutableArray *invitationsToAdd;
  void *v23;
  uint64_t v24;
  NSMutableArray *invitationRecordGUIDsToUpdate;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int64_t int64;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSArray *assetsToPublish;
  uint64_t v37;
  NSString *commentText;
  void *v39;
  uint64_t v40;
  NSDictionary *assetsSharingInfos;
  void *v42;
  void *v43;
  objc_super v45;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v45.receiver = self;
  v45.super_class = (Class)PHCloudSharedAlbumChangeRequest;
  v11 = -[PHChangeRequest init](&v45, sel_init);
  if (v11)
  {
    v12 = -[PHChangeRequestHelper initWithXPCDict:changeRequest:request:clientAuthorization:]([PHChangeRequestHelper alloc], "initWithXPCDict:changeRequest:request:clientAuthorization:", v8, v11, v9, v10);
    helper = v11->super._helper;
    v11->super._helper = v12;

    if (v12)
    {
      PLArrayFromXPCDictionary();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "mutableCopy");
      invitationRecordGUIDsToRemove = v11->_invitationRecordGUIDsToRemove;
      v11->_invitationRecordGUIDsToRemove = (NSMutableArray *)v15;

      if (-[NSMutableArray count](v11->_invitationRecordGUIDsToRemove, "count"))
      {
        -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
        objc_msgSend(v9, "recordUpdateRequest:", v11);
      }
      PLArrayFromXPCDictionary();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "mutableCopy");
      pendingInvitationRecordGUIDs = v11->_pendingInvitationRecordGUIDs;
      v11->_pendingInvitationRecordGUIDs = (NSMutableArray *)v18;

      if (-[NSMutableArray count](v11->_pendingInvitationRecordGUIDs, "count"))
      {
        -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
        objc_msgSend(v9, "recordUpdateRequest:", v11);
      }
      PLArrayFromXPCDictionary();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "mutableCopy");
      invitationsToAdd = v11->_invitationsToAdd;
      v11->_invitationsToAdd = (NSMutableArray *)v21;

      if (-[NSMutableArray count](v11->_invitationsToAdd, "count"))
      {
        -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
        objc_msgSend(v9, "recordUpdateRequest:", v11);
      }
      PLArrayFromXPCDictionary();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "mutableCopy");
      invitationRecordGUIDsToUpdate = v11->_invitationRecordGUIDsToUpdate;
      v11->_invitationRecordGUIDsToUpdate = (NSMutableArray *)v24;

      if (-[NSMutableArray count](v11->_invitationRecordGUIDsToUpdate, "count"))
      {
        v11->_invitationStateToUpdate = xpc_dictionary_get_int64(v8, "invitationStateToUpdate");
        -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
        objc_msgSend(v9, "recordUpdateRequest:", v11);
      }
      xpc_dictionary_get_value(v8, "isPublic");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v26)
      {
        -[PHCloudSharedAlbumChangeRequest setIsPublic:](v11, "setIsPublic:", xpc_BOOL_get_value(v26));
        objc_msgSend(v9, "recordUpdateRequest:", v11);
      }
      xpc_dictionary_get_value(v8, "cloudMultipleContributorsEnabled");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
      {
        -[PHCloudSharedAlbumChangeRequest setCloudMultipleContributorsEnabled:](v11, "setCloudMultipleContributorsEnabled:", xpc_BOOL_get_value(v28));
        objc_msgSend(v9, "recordUpdateRequest:", v11);
      }
      PLStringFromXPCDictionary();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        -[PHCloudSharedAlbumChangeRequest setCloudOwnerEmail:](v11, "setCloudOwnerEmail:", v30);
        objc_msgSend(v9, "recordUpdateRequest:", v11);
      }
      int64 = xpc_dictionary_get_int64(v8, "invitationState");
      if (int64)
      {
        -[PHCloudSharedAlbumChangeRequest setInvitationState:](v11, "setInvitationState:", int64);
        objc_msgSend(v9, "recordUpdateRequest:", v11);
      }
      xpc_dictionary_get_value(v8, "didSendPendingInvitations");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v32;
      if (v32)
      {
        v11->_didSendPendingInvitations = xpc_BOOL_get_value(v32);
        objc_msgSend(v9, "recordUpdateRequest:", v11);
      }
      PLArrayFromXPCDictionary();
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "mutableCopy");
      assetsToPublish = v11->_assetsToPublish;
      v11->_assetsToPublish = (NSArray *)v35;

      if (-[NSArray count](v11->_assetsToPublish, "count"))
      {
        PLStringFromXPCDictionary();
        v37 = objc_claimAutoreleasedReturnValue();
        commentText = v11->_commentText;
        v11->_commentText = (NSString *)v37;

        PLDictionaryFromXPCDictionary();
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "mutableCopy");
        assetsSharingInfos = v11->_assetsSharingInfos;
        v11->_assetsSharingInfos = (NSDictionary *)v40;

        -[PHChangeRequestHelper setMutated:](v11->super._helper, "setMutated:", 1);
        objc_msgSend(v9, "recordUpdateRequest:", v11);
      }
      xpc_dictionary_get_value(v8, "didPublish");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if (v42)
      {
        v11->_didPublish = xpc_BOOL_get_value(v42);
        objc_msgSend(v9, "recordUpdateRequest:", v11);
      }

    }
  }

  return v11;
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

  if (-[NSMutableArray count](self->_invitationRecordGUIDsToRemove, "count"))
    PLXPCDictionarySetArray();
  if (-[NSMutableArray count](self->_pendingInvitationRecordGUIDs, "count"))
    PLXPCDictionarySetArray();
  if (-[NSMutableArray count](self->_invitationsToAdd, "count"))
    PLXPCDictionarySetArray();
  if (-[NSMutableArray count](self->_invitationRecordGUIDsToUpdate, "count"))
  {
    PLXPCDictionarySetArray();
    xpc_dictionary_set_int64(xdict, "invitationStateToUpdate", self->_invitationStateToUpdate);
  }
  if (self->_didSetIsPublic)
    xpc_dictionary_set_BOOL(xdict, "isPublic", self->_isPublic);
  if (self->_didSetCloudMultipleContributorsEnabled)
    xpc_dictionary_set_BOOL(xdict, "cloudMultipleContributorsEnabled", self->_cloudMultipleContributorsEnabled);
  if (self->_didSetCloudOwnerEmail)
    PLXPCDictionarySetString();
  if (self->_didSetInvitationState)
    xpc_dictionary_set_int64(xdict, "invitationState", self->_invitationState);
  if (self->_didSendPendingInvitations)
    xpc_dictionary_set_BOOL(xdict, "didSendPendingInvitations", 1);
  if (-[NSArray count](self->_assetsToPublish, "count"))
    PLXPCDictionarySetArray();
  if (-[NSDictionary count](self->_assetsSharingInfos, "count"))
    PLXPCDictionarySetDictionary();
  if (self->_commentText)
    PLXPCDictionarySetString();
  v5 = xdict;
  if (self->_didPublish)
  {
    xpc_dictionary_set_BOOL(xdict, "didPublish", 1);
    v5 = xdict;
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

- (NSString)cloudOwnerFirstName
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("cloudOwnerFirstName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setCloudOwnerFirstName:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("cloudOwnerFirstName"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("cloudOwnerFirstName"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("cloudOwnerFirstName"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("cloudOwnerFirstName"));
  }

}

- (NSString)cloudOwnerLastName
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("cloudOwnerLastName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setCloudOwnerLastName:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("cloudOwnerLastName"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("cloudOwnerLastName"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("cloudOwnerLastName"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("cloudOwnerLastName"));
  }

}

- (NSString)cloudOwnerFullName
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("cloudOwnerFullName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)setCloudOwnerFullName:(id)a3
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
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("cloudOwnerFullName"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObject:", CFSTR("cloudOwnerFullName"));
  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", CFSTR("cloudOwnerFullName"));

    -[PHChangeRequest helper](self, "helper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nilMutations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", CFSTR("cloudOwnerFullName"));
  }

}

- (BOOL)isOwned
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("isOwned"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setIsOwned:(BOOL)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("isOwned"));

}

- (BOOL)cloudNotificationsEnabled
{
  void *v3;
  void *v4;
  void *v5;

  +[PHPhotoLibrary assertTransaction](PHPhotoLibrary, "assertTransaction");
  -[PHChangeRequest helper](self, "helper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mutations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("cloudNotificationsEnabled"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v5, "BOOLValue");
  return (char)v3;
}

- (void)setCloudNotificationsEnabled:(BOOL)a3
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
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("cloudNotificationsEnabled"));

}

- (void)setIsPublic:(BOOL)a3
{
  self->_isPublic = a3;
  self->_didSetIsPublic = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (BOOL)isPublic
{
  return self->_isPublic;
}

- (void)setCloudMultipleContributorsEnabled:(BOOL)a3
{
  self->_cloudMultipleContributorsEnabled = a3;
  self->_didSetCloudMultipleContributorsEnabled = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (BOOL)cloudMultipleContributorsEnabled
{
  return self->_cloudMultipleContributorsEnabled;
}

- (void)setCloudOwnerEmail:(id)a3
{
  objc_storeStrong((id *)&self->_cloudOwnerEmail, a3);
  self->_didSetCloudOwnerEmail = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (NSString)cloudOwnerEmail
{
  return self->_cloudOwnerEmail;
}

- (void)setInvitationState:(int64_t)a3
{
  self->_invitationState = a3;
  self->_didSetInvitationState = 1;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)setDidPublish:(BOOL)a3
{
  self->_didPublish = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)publish
{
  -[PHCloudSharedAlbumChangeRequest setDidPublish:](self, "setDidPublish:", 1);
}

- (void)addInvitationRecordWithFirstName:(id)a3 lastName:(id)a4 fullName:(id)a5 emails:(id)a6 phones:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSMutableArray *v16;
  NSMutableArray *invitationsToAdd;
  void *v18;
  id v19;

  v19 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v14, "count") || objc_msgSend(v15, "count"))
  {
    if (!self->_invitationsToAdd)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      invitationsToAdd = self->_invitationsToAdd;
      self->_invitationsToAdd = v16;

    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("firstName"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, CFSTR("lastName"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v13, CFSTR("fullName"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v14, CFSTR("emails"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v15, CFSTR("phones"));
    -[NSMutableArray addObject:](self->_invitationsToAdd, "addObject:", v18);
    -[PHChangeRequest didMutate](self, "didMutate");

  }
}

- (void)setDidSendPendingInvitations:(BOOL)a3
{
  self->_didSendPendingInvitations = a3;
  -[PHChangeRequest didMutate](self, "didMutate");
}

- (void)sendPendingInvitations
{
  -[PHCloudSharedAlbumChangeRequest setDidSendPendingInvitations:](self, "setDidSendPendingInvitations:", 1);
}

- (void)resendPendingInvitationRecords:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableArray *pendingInvitationRecordGUIDs;
  NSMutableArray *v11;
  NSMutableArray *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          pendingInvitationRecordGUIDs = self->_pendingInvitationRecordGUIDs;
          if (!pendingInvitationRecordGUIDs)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
            v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
            v12 = self->_pendingInvitationRecordGUIDs;
            self->_pendingInvitationRecordGUIDs = v11;

            pendingInvitationRecordGUIDs = self->_pendingInvitationRecordGUIDs;
          }
          objc_msgSend(v9, "cloudGUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](pendingInvitationRecordGUIDs, "addObject:", v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  if (-[NSMutableArray count](self->_pendingInvitationRecordGUIDs, "count"))
    -[PHCloudSharedAlbumChangeRequest setDidSendPendingInvitations:](self, "setDidSendPendingInvitations:", 1);

}

- (void)removeCloudSharedAlbumInvitationRecords:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableArray *invitationRecordGUIDsToRemove;
  NSMutableArray *v11;
  NSMutableArray *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          invitationRecordGUIDsToRemove = self->_invitationRecordGUIDsToRemove;
          if (!invitationRecordGUIDsToRemove)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
            v11 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
            v12 = self->_invitationRecordGUIDsToRemove;
            self->_invitationRecordGUIDsToRemove = v11;

            invitationRecordGUIDsToRemove = self->_invitationRecordGUIDsToRemove;
          }
          objc_msgSend(v9, "cloudGUID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](invitationRecordGUIDsToRemove, "addObject:", v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  if (-[NSMutableArray count](self->_invitationRecordGUIDsToRemove, "count"))
    -[PHChangeRequest didMutate](self, "didMutate");

}

- (void)setInvitationStateLocalForInvitationRecords:(id)a3 invitationStateLocal:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSMutableArray *invitationRecordGUIDsToUpdate;
  NSMutableArray *v13;
  NSMutableArray *v14;
  void *v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          invitationRecordGUIDsToUpdate = self->_invitationRecordGUIDsToUpdate;
          if (!invitationRecordGUIDsToUpdate)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
            v13 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
            v14 = self->_invitationRecordGUIDsToUpdate;
            self->_invitationRecordGUIDsToUpdate = v13;

            invitationRecordGUIDsToUpdate = self->_invitationRecordGUIDsToUpdate;
          }
          objc_msgSend(v11, "cloudGUID");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](invitationRecordGUIDsToUpdate, "addObject:", v15);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  if (-[NSMutableArray count](self->_invitationRecordGUIDsToUpdate, "count"))
  {
    self->_invitationStateToUpdate = (int)objc_msgSend(v16, "intValue");
    -[PHChangeRequest didMutate](self, "didMutate");
  }

}

- (void)stopSharing
{
  id v3;

  -[PHCloudSharedAlbum invitationRecords](self->_cloudSharedAlbum, "invitationRecords");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PHCloudSharedAlbumChangeRequest removeCloudSharedAlbumInvitationRecords:](self, "removeCloudSharedAlbumInvitationRecords:", v3);

}

- (void)acceptInvitation
{
  -[PHCloudSharedAlbumChangeRequest setInvitationState:](self, "setInvitationState:", 2);
}

- (void)declineInvitation
{
  -[PHCloudSharedAlbumChangeRequest setInvitationState:](self, "setInvitationState:", 4);
}

- (void)publishBatchOfOriginalAssets:(id)a3 withBatchCommentText:(id)a4 creationOptionsPerAsset:(id)a5
{
  id v8;
  id v9;
  NSDictionary **p_assetsSharingInfos;
  uint64_t v11;
  NSDictionary *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id *location;
  PHCloudSharedAlbumChangeRequest *v29;
  id v30;
  void *v31;
  id obj;
  uint64_t v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v27 = a4;
  v30 = a4;
  v9 = a5;
  v29 = self;
  p_assetsSharingInfos = &self->_assetsSharingInfos;
  if (!self->_assetsSharingInfos)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *p_assetsSharingInfos;
    *p_assetsSharingInfos = (NSDictionary *)v11;

  }
  location = (id *)&self->_assetsSharingInfos;
  v31 = v8;
  PFMap();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v34 = (id)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v14)
  {
    v15 = v14;
    v33 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v36 != v33)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v9, "objectForKeyedSubscript:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "metadataCopyOptions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "numberWithInt:", objc_msgSend(v21, "shouldCopyLocationData") ^ 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v22, CFSTR("excludeLocation"));

        v23 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v9, "objectForKeyedSubscript:", v17);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "adjustmentBakeInOptions");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "numberWithBool:", objc_msgSend(v25, "flattenLivePhotoToStillIfNeeded"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v26, CFSTR("useStillImageOnly"));

        objc_msgSend(v34, "setObject:forKeyedSubscript:", v18, v17);
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v15);
  }

  objc_storeStrong((id *)&v29->_assetsToPublish, v13);
  objc_storeStrong(location, v34);
  if (v30 && objc_msgSend(v30, "length"))
    objc_storeStrong((id *)&v29->_commentText, v27);
  -[PHChangeRequest didMutate](v29, "didMutate");

}

- (id)managedEntityName
{
  return CFSTR("CloudSharedAlbum");
}

- (id)createManagedObjectForInsertIntoPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D71628];
  v7 = a3;
  -[PHCloudSharedAlbumChangeRequest title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "insertNewCloudSharedAlbumWithTitle:lastInterestingDate:intoLibrary:", v8, v9, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHChangeRequest uuid](self, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUuid:", v11);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PHCloudSharedAlbumChangeRequest isOwned](self, "isOwned"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIsOwned:", v12);

  if (a4 && !v10)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v17 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create cloud shared album"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v15);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (BOOL)applyMutationsToManagedObject:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t k;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  int64_t invitationState;
  int v48;
  id v49;
  NSArray *assetsToPublish;
  NSString *commentText;
  NSDictionary *assetsSharingInfos;
  uint64_t v54;
  id v55;
  PHCloudSharedAlbumChangeRequest *v56;
  id v57;
  void *v58;
  id *v59;
  NSMutableArray *obj;
  id v61;
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  id v76;
  _BYTE v77[128];
  _BYTE v78[128];
  uint8_t v79[128];
  uint8_t buf[4];
  _BOOL4 v81;
  __int16 v82;
  void *v83;
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v61 = a4;
  -[PHChangeRequest helper](self, "helper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0;
  v10 = objc_msgSend(v9, "applyMutationsToManagedObject:error:", v8, &v76);
  v11 = v76;

  if (!v10)
    goto LABEL_53;
  PLPhotoKitGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v13 = -[PHChangeRequest isMutated](self, "isMutated");
    -[PHChangeRequest helper](self, "helper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "mutations");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v81 = v13;
    v82 = 2112;
    v83 = v15;
    _os_log_impl(&dword_1991EC000, v12, OS_LOG_TYPE_DEBUG, "##### isMutated %d mutations %@ will update", buf, 0x12u);

  }
  v16 = v8;
  v17 = v16;
  if (self->_cloudOwnerEmail)
    objc_msgSend(v16, "setCloudOwnerEmail:");
  if (-[NSMutableArray count](self->_invitationRecordGUIDsToRemove, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D71630], "cloudSharedAlbumInvitationRecordsWithGUIDs:inLibrary:", self->_invitationRecordGUIDsToRemove, v61);
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v73;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v73 != v21)
            objc_enumerationMutation(v18);
          objc_msgSend(v17, "userDeleteSubscriberRecord:", *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i));
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v72, v79, 16);
      }
      while (v20);
    }

  }
  else
  {
    v18 = 0;
  }
  v58 = v11;
  v59 = a5;
  if (-[NSMutableArray count](self->_invitationsToAdd, "count"))
  {
    v55 = v18;
    v56 = self;
    v57 = v8;
    v70 = 0u;
    v71 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = self->_invitationsToAdd;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v69;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          v27 = v17;
          if (*(_QWORD *)v69 != v25)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * j);
          v29 = (void *)MEMORY[0x1E0D71630];
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("firstName"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("lastName"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("fullName"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("emails"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("phones"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = v29;
          v17 = v27;
          v36 = (id)objc_msgSend(v35, "insertNewInvitationRecordIntoAlbum:withFirstName:lastName:fullName:emails:phones:inLibrary:", v27, v30, v31, v32, v33, v34, v61);

        }
        v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v68, v78, 16);
      }
      while (v24);
    }

    self = v56;
    v8 = v57;
    a5 = v59;
    v18 = v55;
  }
  if (-[NSMutableArray count](self->_invitationRecordGUIDsToUpdate, "count"))
  {
    objc_msgSend(MEMORY[0x1E0D71630], "cloudSharedAlbumInvitationRecordsWithGUIDs:inLibrary:", self->_invitationRecordGUIDsToUpdate, v61);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v18 = v37;
    v38 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
    if (v38)
    {
      v39 = v38;
      v40 = *(_QWORD *)v65;
      do
      {
        v41 = v18;
        for (k = 0; k != v39; ++k)
        {
          if (*(_QWORD *)v65 != v40)
            objc_enumerationMutation(v41);
          v43 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * k);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_invitationStateToUpdate);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setInvitationStateLocal:", v44);

        }
        v18 = v41;
        v39 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v64, v77, 16);
      }
      while (v39);
    }

    a5 = v59;
  }
  if (self->_didSetIsPublic)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isPublic);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCloudPublicURLEnabledLocal:", v45);

    objc_msgSend(MEMORY[0x1E0D719E0], "updateCloudSharedAlbumPublicURLStateOnServer:", v17);
  }
  if (self->_didSetCloudMultipleContributorsEnabled)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_cloudMultipleContributorsEnabled);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCloudMultipleContributorsEnabledLocal:", v46);

    objc_msgSend(MEMORY[0x1E0D719E0], "updateCloudSharedAlbumMultipleContributorsStateOnServer:", v17);
  }
  if (self->_didSetInvitationState)
  {
    invitationState = self->_invitationState;
    if (invitationState == 4)
    {
      objc_msgSend(MEMORY[0x1E0D719E0], "declinePendingInvitationForAlbum:", v17);
    }
    else if (invitationState == 2)
    {
      v63 = v58;
      v48 = objc_msgSend(MEMORY[0x1E0D719E0], "canAcceptPendingInvitationForAlbum:error:", v17, &v63);
      v49 = v63;

      if (v48)
        objc_msgSend(MEMORY[0x1E0D719E0], "acceptPendingInvitationForAlbum:completionHandler:", v17, 0);
      goto LABEL_45;
    }
  }
  v49 = v58;
LABEL_45:
  if (self->_didSendPendingInvitations)
    objc_msgSend(MEMORY[0x1E0D719E0], "sendPendingInvitationsForAlbum:resendInvitationGUIDs:", v17, self->_pendingInvitationRecordGUIDs);
  assetsToPublish = self->_assetsToPublish;
  if (assetsToPublish)
  {
    commentText = self->_commentText;
    assetsSharingInfos = self->_assetsSharingInfos;
    v62 = v49;
    LOBYTE(v54) = 0;
    LOBYTE(v10) = objc_msgSend(MEMORY[0x1E0D719E0], "prepareToEnqueueBatchOfOriginalAssetUUIDs:withBatchCommentText:assetsSharingInfos:customExportsInfo:andTrimmedVideoPathInfo:sharedAlbum:isNewAlbum:error:", assetsToPublish, commentText, assetsSharingInfos, 0, 0, v17, v54, &v62);
    v11 = v62;

  }
  else
  {
    LOBYTE(v10) = 1;
    v11 = v49;
  }
  if (self->_didPublish)
    objc_msgSend(MEMORY[0x1E0D719E0], "publishCloudSharedAlbumToServer:", v17);

LABEL_53:
  if (a5 && (v10 & 1) == 0)
    *a5 = objc_retainAutorelease(v11);

  return v10;
}

- (BOOL)cloudPublicURLEnabled
{
  return self->_cloudPublicURLEnabled;
}

- (void)setCloudPublicURLEnabled:(BOOL)a3
{
  self->_cloudPublicURLEnabled = a3;
}

- (BOOL)cloudPublicURLEnabledLocal
{
  return self->_cloudPublicURLEnabledLocal;
}

- (void)setCloudPublicURLEnabledLocal:(BOOL)a3
{
  self->_cloudPublicURLEnabledLocal = a3;
}

- (BOOL)cloudMultipleContributorsEnabledLocal
{
  return self->_cloudMultipleContributorsEnabledLocal;
}

- (void)setCloudMultipleContributorsEnabledLocal:(BOOL)a3
{
  self->_cloudMultipleContributorsEnabledLocal = a3;
}

- (int64_t)invitationState
{
  return self->_invitationState;
}

- (PHCloudSharedAlbum)cloudSharedAlbum
{
  return self->_cloudSharedAlbum;
}

- (void)setCloudSharedAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_cloudSharedAlbum, a3);
}

- (NSMutableArray)invitationRecordGUIDsToRemove
{
  return self->_invitationRecordGUIDsToRemove;
}

- (void)setInvitationRecordGUIDsToRemove:(id)a3
{
  objc_storeStrong((id *)&self->_invitationRecordGUIDsToRemove, a3);
}

- (NSMutableArray)pendingInvitationRecordGUIDs
{
  return self->_pendingInvitationRecordGUIDs;
}

- (void)setPendingInvitationRecordGUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_pendingInvitationRecordGUIDs, a3);
}

- (NSMutableArray)invitationsToAdd
{
  return self->_invitationsToAdd;
}

- (void)setInvitationsToAdd:(id)a3
{
  objc_storeStrong((id *)&self->_invitationsToAdd, a3);
}

- (NSMutableArray)invitationRecordGUIDsToUpdate
{
  return self->_invitationRecordGUIDsToUpdate;
}

- (void)setInvitationRecordGUIDsToUpdate:(id)a3
{
  objc_storeStrong((id *)&self->_invitationRecordGUIDsToUpdate, a3);
}

- (NSArray)assetsToPublish
{
  return self->_assetsToPublish;
}

- (void)setAssetsToPublish:(id)a3
{
  objc_storeStrong((id *)&self->_assetsToPublish, a3);
}

- (NSDictionary)assetsSharingInfos
{
  return self->_assetsSharingInfos;
}

- (void)setAssetsSharingInfos:(id)a3
{
  objc_storeStrong((id *)&self->_assetsSharingInfos, a3);
}

- (NSString)commentText
{
  return self->_commentText;
}

- (void)setCommentText:(id)a3
{
  objc_storeStrong((id *)&self->_commentText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commentText, 0);
  objc_storeStrong((id *)&self->_assetsSharingInfos, 0);
  objc_storeStrong((id *)&self->_assetsToPublish, 0);
  objc_storeStrong((id *)&self->_invitationRecordGUIDsToUpdate, 0);
  objc_storeStrong((id *)&self->_invitationsToAdd, 0);
  objc_storeStrong((id *)&self->_pendingInvitationRecordGUIDs, 0);
  objc_storeStrong((id *)&self->_invitationRecordGUIDsToRemove, 0);
  objc_storeStrong((id *)&self->_cloudSharedAlbum, 0);
  objc_storeStrong((id *)&self->_cloudOwnerEmail, 0);
}

uint64_t __109__PHCloudSharedAlbumChangeRequest_publishBatchOfOriginalAssets_withBatchCommentText_creationOptionsPerAsset___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

+ (id)creationRequestForCloudSharedAlbumWithTitle:(id)a3
{
  id v3;
  id v4;

  if (a3)
  {
    v3 = a3;
    v4 = -[PHCloudSharedAlbumChangeRequest initForNewObject]([PHCloudSharedAlbumChangeRequest alloc], "initForNewObject");
    objc_msgSend(v4, "setTitle:", v3);

    objc_msgSend(v4, "setIsOwned:", 1);
    objc_msgSend(v4, "setCloudPublicURLEnabled:", 0);
    objc_msgSend(v4, "setCloudPublicURLEnabledLocal:", 0);
    objc_msgSend(v4, "setCloudMultipleContributorsEnabled:", 1);
    objc_msgSend(v4, "setCloudMultipleContributorsEnabledLocal:", 1);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (id)changeRequestForCloudSharedAlbum:(id)a3
{
  id v3;
  PHCloudSharedAlbumChangeRequest *v4;
  void *v5;
  void *v6;
  PHCloudSharedAlbumChangeRequest *v7;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = [PHCloudSharedAlbumChangeRequest alloc];
    objc_msgSend(v3, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PHCloudSharedAlbumChangeRequest initWithUUID:objectID:](v4, "initWithUUID:objectID:", v5, v6);

    -[PHCloudSharedAlbumChangeRequest setCloudSharedAlbum:](v7, "setCloudSharedAlbum:", v3);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
