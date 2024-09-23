@implementation HDCloudSyncShareSetupMetadata

- (HDCloudSyncShareSetupMetadata)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDCloudSyncShareSetupMetadata)initWithSyncCircleIdentifier:(id)a3 profileIdentifier:(id)a4 shareURLs:(id)a5 ownerCloudKitEmailAddress:(id)a6 shareParticipant:(id)a7 invitationTokensByShareURL:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HDCloudSyncShareSetupMetadata *v21;
  uint64_t v22;
  NSString *syncCircleIdentifier;
  uint64_t v24;
  HKProfileIdentifier *profileIdentifier;
  uint64_t v26;
  NSArray *shareURLs;
  uint64_t v28;
  NSString *ownerCloudKitEmailAddress;
  uint64_t v30;
  NSDictionary *invitationTokensByShareURL;
  void *v33;
  void *v34;
  objc_super v35;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  if (v18)
  {
    if (v19)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncShareSetupMetadata.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ownerCloudKitEmailAddress"));

    if (v19)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncShareSetupMetadata.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("shareParticipant"));

LABEL_3:
  v35.receiver = self;
  v35.super_class = (Class)HDCloudSyncShareSetupMetadata;
  v21 = -[HDCloudSyncShareSetupMetadata init](&v35, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    syncCircleIdentifier = v21->_syncCircleIdentifier;
    v21->_syncCircleIdentifier = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    profileIdentifier = v21->_profileIdentifier;
    v21->_profileIdentifier = (HKProfileIdentifier *)v24;

    v26 = objc_msgSend(v17, "copy");
    shareURLs = v21->_shareURLs;
    v21->_shareURLs = (NSArray *)v26;

    v28 = objc_msgSend(v18, "copy");
    ownerCloudKitEmailAddress = v21->_ownerCloudKitEmailAddress;
    v21->_ownerCloudKitEmailAddress = (NSString *)v28;

    objc_storeStrong((id *)&v21->_shareParticipant, a7);
    v30 = objc_msgSend(v20, "copy");
    invitationTokensByShareURL = v21->_invitationTokensByShareURL;
    v21->_invitationTokensByShareURL = (NSDictionary *)v30;

  }
  return v21;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *syncCircleIdentifier;
  NSString *v6;
  HKProfileIdentifier *profileIdentifier;
  HKProfileIdentifier *v8;
  NSArray *shareURLs;
  NSArray *v10;
  NSString *ownerCloudKitEmailAddress;
  NSString *v12;
  CKShareParticipant *shareParticipant;
  CKShareParticipant *v14;
  BOOL v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_18;
  syncCircleIdentifier = self->_syncCircleIdentifier;
  v6 = (NSString *)v4[1];
  if (syncCircleIdentifier != v6 && (!v6 || !-[NSString isEqualToString:](syncCircleIdentifier, "isEqualToString:")))
    goto LABEL_18;
  profileIdentifier = self->_profileIdentifier;
  v8 = (HKProfileIdentifier *)v4[2];
  if (profileIdentifier != v8 && (!v8 || !-[HKProfileIdentifier isEqual:](profileIdentifier, "isEqual:")))
    goto LABEL_18;
  if (((shareURLs = self->_shareURLs, v10 = (NSArray *)v4[3], shareURLs == v10)
     || v10 && -[NSArray isEqualToArray:](shareURLs, "isEqualToArray:"))
    && ((ownerCloudKitEmailAddress = self->_ownerCloudKitEmailAddress,
         v12 = (NSString *)v4[5],
         ownerCloudKitEmailAddress == v12)
     || v12 && -[NSString isEqualToString:](ownerCloudKitEmailAddress, "isEqualToString:"))
    && ((shareParticipant = self->_shareParticipant, v14 = (CKShareParticipant *)v4[6], shareParticipant == v14)
     || v14 && -[CKShareParticipant isEqual:](shareParticipant, "isEqual:")))
  {
    v15 = -[NSDictionary isEqualToDictionary:](self->_invitationTokensByShareURL, "isEqualToDictionary:", v4[4]);
  }
  else
  {
LABEL_18:
    v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSString hash](self->_syncCircleIdentifier, "hash");
  v4 = -[HKProfileIdentifier hash](self->_profileIdentifier, "hash") ^ v3;
  v5 = -[NSArray hash](self->_shareURLs, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_ownerCloudKitEmailAddress, "hash");
  v7 = -[CKShareParticipant hash](self->_shareParticipant, "hash");
  return v6 ^ v7 ^ -[NSDictionary hash](self->_invitationTokensByShareURL, "hash");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *syncCircleIdentifier;
  id v5;

  syncCircleIdentifier = self->_syncCircleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", syncCircleIdentifier, CFSTR("sync_circle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_profileIdentifier, CFSTR("profile_id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_ownerCloudKitEmailAddress, CFSTR("email"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shareParticipant, CFSTR("share_participant"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_shareURLs, CFSTR("share_urls"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_invitationTokensByShareURL, CFSTR("tokens"));

}

- (HDCloudSyncShareSetupMetadata)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
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
  HDCloudSyncShareSetupMetadata *v16;
  HDCloudSyncShareSetupMetadata *v17;
  void *v18;
  uint64_t v20;
  _QWORD v22[3];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sync_circle"));
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("profile_id"));
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("email"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("share_participant"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v9, CFSTR("share_urls"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  v22[0] = objc_opt_class();
  v12 = (void *)v4;
  v22[1] = objc_opt_class();
  v22[2] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("tokens"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0;
  if (v4)
  {
    v18 = (void *)v20;
    v17 = self;
    if (v20 && v5 && v6 && v10 && v15)
    {
      v17 = -[HDCloudSyncShareSetupMetadata initWithSyncCircleIdentifier:profileIdentifier:shareURLs:ownerCloudKitEmailAddress:shareParticipant:invitationTokensByShareURL:](self, "initWithSyncCircleIdentifier:profileIdentifier:shareURLs:ownerCloudKitEmailAddress:shareParticipant:invitationTokensByShareURL:", v12, v20, v10, v5, v6, v15);
      v16 = v17;
    }
  }
  else
  {
    v18 = (void *)v20;
    v17 = self;
  }

  return v16;
}

+ (HDCloudSyncShareSetupMetadata)cloudSyncShareSetupMetadataWithCodableSharingSetupMetadata:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  HDCloudSyncShareSetupMetadata *v27;
  id v28;
  void *v29;
  HDCloudSyncShareSetupMetadata *v30;
  void *v31;
  id v32;
  NSObject *v34;
  void *v35;
  void *v36;
  id obj;
  id *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = objc_opt_class();
  objc_msgSend(v5, "sourceProfileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v30 = 0;
    goto LABEL_25;
  }
  v38 = a4;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v36 = v5;
  objc_msgSend(v5, "invitationTokens");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v42 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v16 = objc_alloc(MEMORY[0x1E0C99E98]);
        objc_msgSend(v15, "shareURL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v16, "initWithString:", v17);

        objc_msgSend(v10, "addObject:", v18);
        objc_msgSend(v15, "token");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if (v19)
        {
          v20 = (void *)MEMORY[0x1E0CB3710];
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "token");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "_strictlyUnarchivedObjectOfClasses:fromData:error:", v21, v22, v38);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v23)
          {
            v30 = 0;
            v5 = v36;
            goto LABEL_24;
          }
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v23, v18);

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
      if (v12)
        continue;
      break;
    }
  }

  v24 = (void *)MEMORY[0x1E0CB3710];
  v25 = objc_opt_class();
  v5 = v36;
  objc_msgSend(v36, "shareParticipant");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v24, "unarchivedObjectOfClass:fromData:error:", v25, v26, &v40);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v40;

  if (v18)
  {
    v27 = [HDCloudSyncShareSetupMetadata alloc];
    objc_msgSend(v36, "syncCircleIdentifier");
    v28 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "ownerCloudKitEmailAddress");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[HDCloudSyncShareSetupMetadata initWithSyncCircleIdentifier:profileIdentifier:shareURLs:ownerCloudKitEmailAddress:shareParticipant:invitationTokensByShareURL:](v27, "initWithSyncCircleIdentifier:profileIdentifier:shareURLs:ownerCloudKitEmailAddress:shareParticipant:invitationTokensByShareURL:", v28, v9, v10, v29, v18, v39);

    goto LABEL_23;
  }
  _HKInitializeLogging();
  v31 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v34 = v31;
    objc_msgSend(v36, "shareParticipant");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v46 = v35;
    v47 = 2114;
    v48 = obj;
    _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "Failed to unarchive share participant %{public}@: %{public}@", buf, 0x16u);

  }
  v32 = obj;
  v28 = v32;
  if (v32)
  {
    if (v38)
    {
      v28 = objc_retainAutorelease(v32);
      v30 = 0;
      *v38 = v28;
      goto LABEL_23;
    }
    _HKLogDroppedError();
  }
  v30 = 0;
LABEL_23:

LABEL_24:
LABEL_25:

  return v30;
}

- (id)codableSharingSetupMetadataWithError:(id *)a3
{
  HDCodableSharingSetupMetadata *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  HDCodableSharingSetupInvitationToken *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HDCodableSharingSetupMetadata *v18;
  void *v19;
  void *v20;
  void *v21;
  HDCodableSharingSetupMetadata *v22;
  HDCodableSharingSetupMetadata *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(HDCodableSharingSetupMetadata);
  -[HDCloudSyncShareSetupMetadata syncCircleIdentifier](self, "syncCircleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v4;
  -[HDCodableSharingSetupMetadata setSyncCircleIdentifier:](v4, "setSyncCircleIdentifier:", v5);

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HDCloudSyncShareSetupMetadata shareURLs](self, "shareURLs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v13 = objc_alloc_init(HDCodableSharingSetupInvitationToken);
        objc_msgSend(v12, "absoluteString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableSharingSetupInvitationToken setShareURL:](v13, "setShareURL:", v14);

        -[NSDictionary objectForKeyedSubscript:](self->_invitationTokensByShareURL, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, a3);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCodableSharingSetupInvitationToken setToken:](v13, "setToken:", v16);

          -[HDCodableSharingSetupInvitationToken token](v13, "token");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {

            v22 = 0;
            v18 = v24;
            goto LABEL_15;
          }
        }
        objc_msgSend(v6, "addObject:", v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v9)
        continue;
      break;
    }
  }

  v18 = v24;
  -[HDCodableSharingSetupMetadata setInvitationTokens:](v24, "setInvitationTokens:", v6);
  -[HDCodableSharingSetupMetadata setOwnerCloudKitEmailAddress:](v24, "setOwnerCloudKitEmailAddress:", self->_ownerCloudKitEmailAddress);
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_shareParticipant, 1, a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSharingSetupMetadata setShareParticipant:](v24, "setShareParticipant:", v19);

  -[HDCodableSharingSetupMetadata shareParticipant](v24, "shareParticipant");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self->_profileIdentifier, 1, a3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableSharingSetupMetadata setSourceProfileIdentifier:](v24, "setSourceProfileIdentifier:", v21);

    -[HDCodableSharingSetupMetadata sourceProfileIdentifier](v24, "sourceProfileIdentifier");
    v22 = (HDCodableSharingSetupMetadata *)objc_claimAutoreleasedReturnValue();

    if (v22)
      v22 = v24;
  }
  else
  {
    v22 = 0;
  }
LABEL_15:

  return v22;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncShareSetupMetadata syncCircleIdentifier](self, "syncCircleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncShareSetupMetadata profileIdentifier](self, "profileIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncShareSetupMetadata shareURLs](self, "shareURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncShareSetupMetadata ownerCloudKitEmailAddress](self, "ownerCloudKitEmailAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncShareSetupMetadata shareParticipant](self, "shareParticipant");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncShareSetupMetadata invitationTokensByShareURL](self, "invitationTokensByShareURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: \n%@, \n%@, \n%@, \n%@, \n%@, \n%@>"), v5, self, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSString)syncCircleIdentifier
{
  return self->_syncCircleIdentifier;
}

- (HKProfileIdentifier)profileIdentifier
{
  return self->_profileIdentifier;
}

- (NSArray)shareURLs
{
  return self->_shareURLs;
}

- (NSDictionary)invitationTokensByShareURL
{
  return self->_invitationTokensByShareURL;
}

- (NSString)ownerCloudKitEmailAddress
{
  return self->_ownerCloudKitEmailAddress;
}

- (CKShareParticipant)shareParticipant
{
  return self->_shareParticipant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipant, 0);
  objc_storeStrong((id *)&self->_ownerCloudKitEmailAddress, 0);
  objc_storeStrong((id *)&self->_invitationTokensByShareURL, 0);
  objc_storeStrong((id *)&self->_shareURLs, 0);
  objc_storeStrong((id *)&self->_profileIdentifier, 0);
  objc_storeStrong((id *)&self->_syncCircleIdentifier, 0);
}

@end
