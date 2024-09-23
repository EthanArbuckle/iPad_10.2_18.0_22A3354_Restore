@implementation AFCompanionDeviceInfo

- (AFCompanionDeviceInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFCompanionDeviceInfoMutation *);
  AFCompanionDeviceInfo *v5;
  AFCompanionDeviceInfo *v6;
  _AFCompanionDeviceInfoMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *assistantID;
  void *v11;
  uint64_t v12;
  NSString *speechID;
  void *v14;
  uint64_t v15;
  NSString *idsIdentifier;
  void *v17;
  uint64_t v18;
  NSString *productPrefix;
  void *v20;
  uint64_t v21;
  NSString *aceHost;
  void *v23;
  uint64_t v24;
  NSDictionary *syncMetadata;
  void *v26;
  uint64_t v27;
  NSString *siriLanguage;
  objc_super v30;

  v4 = (void (**)(id, _AFCompanionDeviceInfoMutation *))a3;
  v30.receiver = self;
  v30.super_class = (Class)AFCompanionDeviceInfo;
  v5 = -[AFCompanionDeviceInfo init](&v30, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFCompanionDeviceInfoMutation initWithBase:]([_AFCompanionDeviceInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFCompanionDeviceInfoMutation isDirty](v7, "isDirty"))
    {
      -[_AFCompanionDeviceInfoMutation getAssistantID](v7, "getAssistantID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      assistantID = v6->_assistantID;
      v6->_assistantID = (NSString *)v9;

      -[_AFCompanionDeviceInfoMutation getSpeechID](v7, "getSpeechID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      speechID = v6->_speechID;
      v6->_speechID = (NSString *)v12;

      -[_AFCompanionDeviceInfoMutation getIdsIdentifier](v7, "getIdsIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      idsIdentifier = v6->_idsIdentifier;
      v6->_idsIdentifier = (NSString *)v15;

      -[_AFCompanionDeviceInfoMutation getProductPrefix](v7, "getProductPrefix");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      productPrefix = v6->_productPrefix;
      v6->_productPrefix = (NSString *)v18;

      -[_AFCompanionDeviceInfoMutation getAceHost](v7, "getAceHost");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      aceHost = v6->_aceHost;
      v6->_aceHost = (NSString *)v21;

      -[_AFCompanionDeviceInfoMutation getSyncMetadata](v7, "getSyncMetadata");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      syncMetadata = v6->_syncMetadata;
      v6->_syncMetadata = (NSDictionary *)v24;

      v6->_syncMetadataCapability = -[_AFCompanionDeviceInfoMutation getSyncMetadataCapability](v7, "getSyncMetadataCapability");
      v6->_peerToPeerHandoffCapability = -[_AFCompanionDeviceInfoMutation getPeerToPeerHandoffCapability](v7, "getPeerToPeerHandoffCapability");
      v6->_muxSupportCapability = -[_AFCompanionDeviceInfoMutation getMuxSupportCapability](v7, "getMuxSupportCapability");
      v6->_meDevice = -[_AFCompanionDeviceInfoMutation getMeDevice](v7, "getMeDevice");
      -[_AFCompanionDeviceInfoMutation getSiriLanguage](v7, "getSiriLanguage");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "copy");
      siriLanguage = v6->_siriLanguage;
      v6->_siriLanguage = (NSString *)v27;

    }
  }

  return v6;
}

- (AFCompanionDeviceInfo)init
{
  return -[AFCompanionDeviceInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFCompanionDeviceInfo)initWithAssistantID:(id)a3 speechID:(id)a4 idsIdentifier:(id)a5 productPrefix:(id)a6 aceHost:(id)a7 syncMetadata:(id)a8 syncMetadataCapability:(BOOL)a9 peerToPeerHandoffCapability:(BOOL)a10 muxSupportCapability:(BOOL)a11 meDevice:(BOOL)a12 siriLanguage:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  AFCompanionDeviceInfo *v32;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  BOOL v43;
  BOOL v44;
  BOOL v45;
  BOOL v46;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a13;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __197__AFCompanionDeviceInfo_initWithAssistantID_speechID_idsIdentifier_productPrefix_aceHost_syncMetadata_syncMetadataCapability_peerToPeerHandoffCapability_muxSupportCapability_meDevice_siriLanguage___block_invoke;
  v35[3] = &unk_1E3A35350;
  v36 = v18;
  v37 = v19;
  v38 = v20;
  v39 = v21;
  v40 = v22;
  v41 = v23;
  v43 = a9;
  v44 = a10;
  v45 = a11;
  v46 = a12;
  v42 = v24;
  v25 = v24;
  v26 = v23;
  v27 = v22;
  v28 = v21;
  v29 = v20;
  v30 = v19;
  v31 = v18;
  v32 = -[AFCompanionDeviceInfo initWithBuilder:](self, "initWithBuilder:", v35);

  return v32;
}

- (NSString)description
{
  return (NSString *)-[AFCompanionDeviceInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;
  objc_super v13;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v13.receiver = self;
  v13.super_class = (Class)AFCompanionDeviceInfo;
  -[AFCompanionDeviceInfo description](&v13, sel_description);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (self->_syncMetadataCapability)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (self->_peerToPeerHandoffCapability)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (self->_muxSupportCapability)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  if (!self->_meDevice)
    v7 = CFSTR("NO");
  v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {assistantID = %@, speechID = %@, idsIdentifier = %@, productPrefix = %@, aceHost = %@, syncMetadata = %@, syncMetadataCapability = %@, peerToPeerHandoffCapability = %@, muxSupportCapability = %@, meDevice = %@, siriLanguage = %@}"), v5, *(_OWORD *)&self->_assistantID, *(_OWORD *)&self->_idsIdentifier, self->_aceHost, self->_syncMetadata, v8, v9, v10, v7, self->_siriLanguage);

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSUInteger v17;

  v3 = -[NSString hash](self->_assistantID, "hash");
  v4 = -[NSString hash](self->_speechID, "hash") ^ v3;
  v5 = -[NSString hash](self->_idsIdentifier, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_productPrefix, "hash");
  v7 = -[NSString hash](self->_aceHost, "hash");
  v8 = v6 ^ v7 ^ -[NSDictionary hash](self->_syncMetadata, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_syncMetadataCapability);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_peerToPeerHandoffCapability);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 ^ v10 ^ objc_msgSend(v11, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_muxSupportCapability);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_meDevice);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  v17 = v12 ^ v16 ^ -[NSString hash](self->_siriLanguage, "hash");

  return v17;
}

- (BOOL)isEqual:(id)a3
{
  AFCompanionDeviceInfo *v4;
  AFCompanionDeviceInfo *v5;
  _BOOL4 syncMetadataCapability;
  _BOOL4 peerToPeerHandoffCapability;
  _BOOL4 muxSupportCapability;
  NSString *v9;
  NSString *assistantID;
  NSString *v11;
  NSString *speechID;
  NSString *v13;
  NSString *idsIdentifier;
  NSString *v15;
  NSString *productPrefix;
  NSString *v17;
  NSString *aceHost;
  NSDictionary *v19;
  NSDictionary *syncMetadata;
  _BOOL4 meDevice;
  NSString *v22;
  NSString *siriLanguage;
  BOOL v24;

  v4 = (AFCompanionDeviceInfo *)a3;
  if (self == v4)
  {
    v24 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      syncMetadataCapability = self->_syncMetadataCapability;
      if (syncMetadataCapability == -[AFCompanionDeviceInfo syncMetadataCapability](v5, "syncMetadataCapability")
        && (peerToPeerHandoffCapability = self->_peerToPeerHandoffCapability,
            peerToPeerHandoffCapability == -[AFCompanionDeviceInfo peerToPeerHandoffCapability](v5, "peerToPeerHandoffCapability"))&& (muxSupportCapability = self->_muxSupportCapability, muxSupportCapability == -[AFCompanionDeviceInfo muxSupportCapability](v5, "muxSupportCapability")))
      {
        -[AFCompanionDeviceInfo assistantID](v5, "assistantID");
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        assistantID = self->_assistantID;
        if (assistantID == v9 || -[NSString isEqual:](assistantID, "isEqual:", v9))
        {
          -[AFCompanionDeviceInfo speechID](v5, "speechID");
          v11 = (NSString *)objc_claimAutoreleasedReturnValue();
          speechID = self->_speechID;
          if (speechID == v11 || -[NSString isEqual:](speechID, "isEqual:", v11))
          {
            -[AFCompanionDeviceInfo idsIdentifier](v5, "idsIdentifier");
            v13 = (NSString *)objc_claimAutoreleasedReturnValue();
            idsIdentifier = self->_idsIdentifier;
            if (idsIdentifier == v13 || -[NSString isEqual:](idsIdentifier, "isEqual:", v13))
            {
              -[AFCompanionDeviceInfo productPrefix](v5, "productPrefix");
              v15 = (NSString *)objc_claimAutoreleasedReturnValue();
              productPrefix = self->_productPrefix;
              if (productPrefix == v15 || -[NSString isEqual:](productPrefix, "isEqual:", v15))
              {
                -[AFCompanionDeviceInfo aceHost](v5, "aceHost");
                v17 = (NSString *)objc_claimAutoreleasedReturnValue();
                aceHost = self->_aceHost;
                if (aceHost == v17 || -[NSString isEqual:](aceHost, "isEqual:", v17))
                {
                  -[AFCompanionDeviceInfo syncMetadata](v5, "syncMetadata");
                  v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
                  syncMetadata = self->_syncMetadata;
                  if ((syncMetadata == v19 || -[NSDictionary isEqual:](syncMetadata, "isEqual:", v19))
                    && (meDevice = self->_meDevice, meDevice == -[AFCompanionDeviceInfo meDevice](v5, "meDevice")))
                  {
                    -[AFCompanionDeviceInfo siriLanguage](v5, "siriLanguage");
                    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
                    siriLanguage = self->_siriLanguage;
                    v24 = siriLanguage == v22 || -[NSString isEqual:](siriLanguage, "isEqual:", v22);

                  }
                  else
                  {
                    v24 = 0;
                  }

                }
                else
                {
                  v24 = 0;
                }

              }
              else
              {
                v24 = 0;
              }

            }
            else
            {
              v24 = 0;
            }

          }
          else
          {
            v24 = 0;
          }

        }
        else
        {
          v24 = 0;
        }

      }
      else
      {
        v24 = 0;
      }

    }
    else
    {
      v24 = 0;
    }
  }

  return v24;
}

- (AFCompanionDeviceInfo)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  AFCompanionDeviceInfo *v18;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCompanionDeviceInfo::assistantID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCompanionDeviceInfo::speechID"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCompanionDeviceInfo::idsIdentifier"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCompanionDeviceInfo::productPrefix"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCompanionDeviceInfo::aceHost"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, v7, v8, v9, v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v11, CFSTR("AFCompanionDeviceInfo::syncMetadata"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCompanionDeviceInfo::syncMetadataCapability"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v13, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCompanionDeviceInfo::peerToPeerHandoffCapability"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v14, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCompanionDeviceInfo::muxSupportCapability"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v15, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCompanionDeviceInfo::meDevice"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v16, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFCompanionDeviceInfo::siriLanguage"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE3(v20) = v9;
  BYTE2(v20) = v7;
  BYTE1(v20) = v6;
  LOBYTE(v20) = v5;
  v18 = -[AFCompanionDeviceInfo initWithAssistantID:speechID:idsIdentifier:productPrefix:aceHost:syncMetadata:syncMetadataCapability:peerToPeerHandoffCapability:muxSupportCapability:meDevice:siriLanguage:](self, "initWithAssistantID:speechID:idsIdentifier:productPrefix:aceHost:syncMetadata:syncMetadataCapability:peerToPeerHandoffCapability:muxSupportCapability:meDevice:siriLanguage:", v25, v24, v23, v22, v21, v12, v20, v17);

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *assistantID;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  assistantID = self->_assistantID;
  v9 = a3;
  objc_msgSend(v9, "encodeObject:forKey:", assistantID, CFSTR("AFCompanionDeviceInfo::assistantID"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_speechID, CFSTR("AFCompanionDeviceInfo::speechID"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_idsIdentifier, CFSTR("AFCompanionDeviceInfo::idsIdentifier"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_productPrefix, CFSTR("AFCompanionDeviceInfo::productPrefix"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_aceHost, CFSTR("AFCompanionDeviceInfo::aceHost"));
  objc_msgSend(v9, "encodeObject:forKey:", self->_syncMetadata, CFSTR("AFCompanionDeviceInfo::syncMetadata"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_syncMetadataCapability);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v5, CFSTR("AFCompanionDeviceInfo::syncMetadataCapability"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_peerToPeerHandoffCapability);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v6, CFSTR("AFCompanionDeviceInfo::peerToPeerHandoffCapability"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_muxSupportCapability);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v7, CFSTR("AFCompanionDeviceInfo::muxSupportCapability"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_meDevice);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "encodeObject:forKey:", v8, CFSTR("AFCompanionDeviceInfo::meDevice"));

  objc_msgSend(v9, "encodeObject:forKey:", self->_siriLanguage, CFSTR("AFCompanionDeviceInfo::siriLanguage"));
}

- (AFCompanionDeviceInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFCompanionDeviceInfo *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  char v25;
  void *v26;
  id v27;
  char v28;
  void *v29;
  id v30;
  char v31;
  void *v32;
  id v33;
  char v34;
  void *v35;
  id v36;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("assistantID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v45 = v6;
    else
      v45 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("speechID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v44 = v8;
    else
      v44 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("idsIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v43 = v9;
    else
      v43 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("productPrefix"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v42 = v10;
    else
      v42 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("aceHost"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v41 = v11;
    else
      v41 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("syncMetadata"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v40 = v5;
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v12, "count"));
      v46 = 0u;
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v39 = v12;
      v14 = v12;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v47;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v47 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v14, "objectForKey:", v19);
              v20 = (id)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = v20;

                if (v21)
                  objc_msgSend(v13, "setObject:forKey:", v21, v19);
              }
              else
              {

                v21 = 0;
              }

            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        }
        while (v16);
      }

      v22 = (void *)objc_msgSend(v13, "copy");
      v12 = v39;
      v5 = v40;
    }
    else
    {
      v22 = 0;
    }

    objc_msgSend(v5, "objectForKey:", CFSTR("syncMetadataCapability"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v24 = v23;
    else
      v24 = 0;

    v25 = objc_msgSend(v24, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("peerToPeerHandoffCapability"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v27 = v26;
    else
      v27 = 0;

    v28 = objc_msgSend(v27, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("muxSupportCapability"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v29;
    else
      v30 = 0;

    v31 = objc_msgSend(v30, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("meDevice"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v32;
    else
      v33 = 0;

    v34 = objc_msgSend(v33, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("siriLanguage"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v36 = v35;
    else
      v36 = 0;

    BYTE3(v38) = v34;
    BYTE2(v38) = v31;
    BYTE1(v38) = v28;
    LOBYTE(v38) = v25;
    self = -[AFCompanionDeviceInfo initWithAssistantID:speechID:idsIdentifier:productPrefix:aceHost:syncMetadata:syncMetadataCapability:peerToPeerHandoffCapability:muxSupportCapability:meDevice:siriLanguage:](self, "initWithAssistantID:speechID:idsIdentifier:productPrefix:aceHost:syncMetadata:syncMetadataCapability:peerToPeerHandoffCapability:muxSupportCapability:meDevice:siriLanguage:", v45, v44, v43, v42, v41, v22, v38, v36);

    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *assistantID;
  NSString *speechID;
  NSString *idsIdentifier;
  NSString *productPrefix;
  NSString *aceHost;
  void *v10;
  NSDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSString *siriLanguage;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  assistantID = self->_assistantID;
  if (assistantID)
    objc_msgSend(v3, "setObject:forKey:", assistantID, CFSTR("assistantID"));
  speechID = self->_speechID;
  if (speechID)
    objc_msgSend(v4, "setObject:forKey:", speechID, CFSTR("speechID"));
  idsIdentifier = self->_idsIdentifier;
  if (idsIdentifier)
    objc_msgSend(v4, "setObject:forKey:", idsIdentifier, CFSTR("idsIdentifier"));
  productPrefix = self->_productPrefix;
  if (productPrefix)
    objc_msgSend(v4, "setObject:forKey:", productPrefix, CFSTR("productPrefix"));
  aceHost = self->_aceHost;
  if (aceHost)
    objc_msgSend(v4, "setObject:forKey:", aceHost, CFSTR("aceHost"));
  if (self->_syncMetadata)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[NSDictionary count](self->_syncMetadata, "count"));
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = self->_syncMetadata;
    v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          -[NSDictionary objectForKey:](self->_syncMetadata, "objectForKey:", v16, (_QWORD)v26);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKey:", v17, v16);

        }
        v13 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v13);
    }

    v18 = (void *)objc_msgSend(v10, "copy");
    objc_msgSend(v4, "setObject:forKey:", v18, CFSTR("syncMetadata"));

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_syncMetadataCapability, (_QWORD)v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v19, CFSTR("syncMetadataCapability"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_peerToPeerHandoffCapability);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v20, CFSTR("peerToPeerHandoffCapability"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_muxSupportCapability);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v21, CFSTR("muxSupportCapability"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_meDevice);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v22, CFSTR("meDevice"));

  siriLanguage = self->_siriLanguage;
  if (siriLanguage)
    objc_msgSend(v4, "setObject:forKey:", siriLanguage, CFSTR("siriLanguage"));
  v24 = (void *)objc_msgSend(v4, "copy");

  return v24;
}

- (NSString)assistantID
{
  return self->_assistantID;
}

- (NSString)speechID
{
  return self->_speechID;
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (NSString)productPrefix
{
  return self->_productPrefix;
}

- (NSString)aceHost
{
  return self->_aceHost;
}

- (NSDictionary)syncMetadata
{
  return self->_syncMetadata;
}

- (BOOL)syncMetadataCapability
{
  return self->_syncMetadataCapability;
}

- (BOOL)peerToPeerHandoffCapability
{
  return self->_peerToPeerHandoffCapability;
}

- (BOOL)muxSupportCapability
{
  return self->_muxSupportCapability;
}

- (BOOL)meDevice
{
  return self->_meDevice;
}

- (NSString)siriLanguage
{
  return self->_siriLanguage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriLanguage, 0);
  objc_storeStrong((id *)&self->_syncMetadata, 0);
  objc_storeStrong((id *)&self->_aceHost, 0);
  objc_storeStrong((id *)&self->_productPrefix, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_speechID, 0);
  objc_storeStrong((id *)&self->_assistantID, 0);
}

void __197__AFCompanionDeviceInfo_initWithAssistantID_speechID_idsIdentifier_productPrefix_aceHost_syncMetadata_syncMetadataCapability_peerToPeerHandoffCapability_muxSupportCapability_meDevice_siriLanguage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAssistantID:", v3);
  objc_msgSend(v4, "setSpeechID:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setIdsIdentifier:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setProductPrefix:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setAceHost:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v4, "setSyncMetadata:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v4, "setSyncMetadataCapability:", *(unsigned __int8 *)(a1 + 88));
  objc_msgSend(v4, "setPeerToPeerHandoffCapability:", *(unsigned __int8 *)(a1 + 89));
  objc_msgSend(v4, "setMuxSupportCapability:", *(unsigned __int8 *)(a1 + 90));
  objc_msgSend(v4, "setMeDevice:", *(unsigned __int8 *)(a1 + 91));
  objc_msgSend(v4, "setSiriLanguage:", *(_QWORD *)(a1 + 80));

}

+ (id)newWithBuilder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBuilder:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)mutatedCopyWithMutator:(id)a3
{
  void (**v4)(id, _AFCompanionDeviceInfoMutation *);
  _AFCompanionDeviceInfoMutation *v5;
  AFCompanionDeviceInfo *v6;
  void *v7;
  uint64_t v8;
  NSString *assistantID;
  void *v10;
  uint64_t v11;
  NSString *speechID;
  void *v13;
  uint64_t v14;
  NSString *idsIdentifier;
  void *v16;
  uint64_t v17;
  NSString *productPrefix;
  void *v19;
  uint64_t v20;
  NSString *aceHost;
  void *v22;
  uint64_t v23;
  NSDictionary *syncMetadata;
  void *v25;
  uint64_t v26;
  NSString *siriLanguage;

  v4 = (void (**)(id, _AFCompanionDeviceInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFCompanionDeviceInfoMutation initWithBase:]([_AFCompanionDeviceInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFCompanionDeviceInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFCompanionDeviceInfo);
      -[_AFCompanionDeviceInfoMutation getAssistantID](v5, "getAssistantID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      assistantID = v6->_assistantID;
      v6->_assistantID = (NSString *)v8;

      -[_AFCompanionDeviceInfoMutation getSpeechID](v5, "getSpeechID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      speechID = v6->_speechID;
      v6->_speechID = (NSString *)v11;

      -[_AFCompanionDeviceInfoMutation getIdsIdentifier](v5, "getIdsIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      idsIdentifier = v6->_idsIdentifier;
      v6->_idsIdentifier = (NSString *)v14;

      -[_AFCompanionDeviceInfoMutation getProductPrefix](v5, "getProductPrefix");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      productPrefix = v6->_productPrefix;
      v6->_productPrefix = (NSString *)v17;

      -[_AFCompanionDeviceInfoMutation getAceHost](v5, "getAceHost");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      aceHost = v6->_aceHost;
      v6->_aceHost = (NSString *)v20;

      -[_AFCompanionDeviceInfoMutation getSyncMetadata](v5, "getSyncMetadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      syncMetadata = v6->_syncMetadata;
      v6->_syncMetadata = (NSDictionary *)v23;

      v6->_syncMetadataCapability = -[_AFCompanionDeviceInfoMutation getSyncMetadataCapability](v5, "getSyncMetadataCapability");
      v6->_peerToPeerHandoffCapability = -[_AFCompanionDeviceInfoMutation getPeerToPeerHandoffCapability](v5, "getPeerToPeerHandoffCapability");
      v6->_muxSupportCapability = -[_AFCompanionDeviceInfoMutation getMuxSupportCapability](v5, "getMuxSupportCapability");
      v6->_meDevice = -[_AFCompanionDeviceInfoMutation getMeDevice](v5, "getMeDevice");
      -[_AFCompanionDeviceInfoMutation getSiriLanguage](v5, "getSiriLanguage");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      siriLanguage = v6->_siriLanguage;
      v6->_siriLanguage = (NSString *)v26;

    }
    else
    {
      v6 = (AFCompanionDeviceInfo *)-[AFCompanionDeviceInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFCompanionDeviceInfo *)-[AFCompanionDeviceInfo copy](self, "copy");
  }

  return v6;
}

@end
