@implementation AFHomeAccessoryInfo

- (AFHomeAccessoryInfo)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFHomeAccessoryInfoMutation *);
  AFHomeAccessoryInfo *v5;
  AFHomeAccessoryInfo *v6;
  _AFHomeAccessoryInfoMutation *v7;
  void *v8;
  uint64_t v9;
  NSUUID *uniqueIdentifier;
  void *v11;
  uint64_t v12;
  NSUUID *loggingUniqueIdentifier;
  void *v14;
  uint64_t v15;
  NSString *name;
  void *v17;
  uint64_t v18;
  NSString *model;
  void *v20;
  uint64_t v21;
  NSString *roomName;
  void *v23;
  uint64_t v24;
  NSString *assistantIdentifier;
  void *v26;
  uint64_t v27;
  NSString *manufacturer;
  void *v29;
  uint64_t v30;
  NSString *categoryType;
  objc_super v33;

  v4 = (void (**)(id, _AFHomeAccessoryInfoMutation *))a3;
  v33.receiver = self;
  v33.super_class = (Class)AFHomeAccessoryInfo;
  v5 = -[AFHomeAccessoryInfo init](&v33, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFHomeAccessoryInfoMutation initWithBase:]([_AFHomeAccessoryInfoMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFHomeAccessoryInfoMutation isDirty](v7, "isDirty"))
    {
      -[_AFHomeAccessoryInfoMutation getUniqueIdentifier](v7, "getUniqueIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      uniqueIdentifier = v6->_uniqueIdentifier;
      v6->_uniqueIdentifier = (NSUUID *)v9;

      -[_AFHomeAccessoryInfoMutation getLoggingUniqueIdentifier](v7, "getLoggingUniqueIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      loggingUniqueIdentifier = v6->_loggingUniqueIdentifier;
      v6->_loggingUniqueIdentifier = (NSUUID *)v12;

      -[_AFHomeAccessoryInfoMutation getName](v7, "getName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      name = v6->_name;
      v6->_name = (NSString *)v15;

      -[_AFHomeAccessoryInfoMutation getModel](v7, "getModel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      model = v6->_model;
      v6->_model = (NSString *)v18;

      -[_AFHomeAccessoryInfoMutation getRoomName](v7, "getRoomName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      roomName = v6->_roomName;
      v6->_roomName = (NSString *)v21;

      -[_AFHomeAccessoryInfoMutation getAssistantIdentifier](v7, "getAssistantIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      assistantIdentifier = v6->_assistantIdentifier;
      v6->_assistantIdentifier = (NSString *)v24;

      v6->_isSpeaker = -[_AFHomeAccessoryInfoMutation getIsSpeaker](v7, "getIsSpeaker");
      v6->_hasActiveThirdPartyMusicSubscription = -[_AFHomeAccessoryInfoMutation getHasActiveThirdPartyMusicSubscription](v7, "getHasActiveThirdPartyMusicSubscription");
      -[_AFHomeAccessoryInfoMutation getManufacturer](v7, "getManufacturer");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "copy");
      manufacturer = v6->_manufacturer;
      v6->_manufacturer = (NSString *)v27;

      -[_AFHomeAccessoryInfoMutation getCategoryType](v7, "getCategoryType");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "copy");
      categoryType = v6->_categoryType;
      v6->_categoryType = (NSString *)v30;

      v6->_schemaCategoryType = -[_AFHomeAccessoryInfoMutation getSchemaCategoryType](v7, "getSchemaCategoryType");
    }

  }
  return v6;
}

- (AFHomeAccessoryInfo)init
{
  return -[AFHomeAccessoryInfo initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFHomeAccessoryInfo)initWithUniqueIdentifier:(id)a3 loggingUniqueIdentifier:(id)a4 name:(id)a5 model:(id)a6 roomName:(id)a7 assistantIdentifier:(id)a8 isSpeaker:(BOOL)a9 hasActiveThirdPartyMusicSubscription:(BOOL)a10 manufacturer:(id)a11 categoryType:(id)a12 schemaCategoryType:(int64_t)a13
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
  id v32;
  id v33;
  AFHomeAccessoryInfo *v34;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  int64_t v46;
  BOOL v47;
  BOOL v48;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a11;
  v25 = a12;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __204__AFHomeAccessoryInfo_initWithUniqueIdentifier_loggingUniqueIdentifier_name_model_roomName_assistantIdentifier_isSpeaker_hasActiveThirdPartyMusicSubscription_manufacturer_categoryType_schemaCategoryType___block_invoke;
  v37[3] = &unk_1E3A304D0;
  v38 = v18;
  v39 = v19;
  v40 = v20;
  v41 = v21;
  v42 = v22;
  v43 = v23;
  v47 = a9;
  v48 = a10;
  v44 = v24;
  v45 = v25;
  v46 = a13;
  v26 = v25;
  v27 = v24;
  v28 = v23;
  v29 = v22;
  v30 = v21;
  v31 = v20;
  v32 = v19;
  v33 = v18;
  v34 = -[AFHomeAccessoryInfo initWithBuilder:](self, "initWithBuilder:", v37);

  return v34;
}

- (NSString)description
{
  return (NSString *)-[AFHomeAccessoryInfo _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  objc_super v11;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v11.receiver = self;
  v11.super_class = (Class)AFHomeAccessoryInfo;
  -[AFHomeAccessoryInfo description](&v11, sel_description);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = CFSTR("YES");
  if (self->_isSpeaker)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (!self->_hasActiveThirdPartyMusicSubscription)
    v7 = CFSTR("NO");
  v9 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {uniqueIdentifier = %@, loggingUniqueIdentifier = %@, name = %@, model = %@, roomName = %@, assistantIdentifier = %@, isSpeaker = %@, hasActiveThirdPartyMusicSubscription = %@, manufacturer = %@, categoryType = %@, schemaCategoryType = %lld}"), v5, *(_OWORD *)&self->_uniqueIdentifier, *(_OWORD *)&self->_name, self->_roomName, self->_assistantIdentifier, v8, v7, self->_manufacturer, self->_categoryType, self->_schemaCategoryType);

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  void *v15;
  unint64_t v16;

  v3 = -[NSUUID hash](self->_uniqueIdentifier, "hash");
  v4 = -[NSUUID hash](self->_loggingUniqueIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_name, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_model, "hash");
  v7 = -[NSString hash](self->_roomName, "hash");
  v8 = v6 ^ v7 ^ -[NSString hash](self->_assistantIdentifier, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSpeaker);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasActiveThirdPartyMusicSubscription);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v8 ^ v10 ^ objc_msgSend(v11, "hash");
  v13 = -[NSString hash](self->_manufacturer, "hash");
  v14 = v13 ^ -[NSString hash](self->_categoryType, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_schemaCategoryType);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v12 ^ v14 ^ objc_msgSend(v15, "hash");

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  AFHomeAccessoryInfo *v4;
  AFHomeAccessoryInfo *v5;
  _BOOL4 isSpeaker;
  _BOOL4 hasActiveThirdPartyMusicSubscription;
  int64_t schemaCategoryType;
  NSUUID *v9;
  NSUUID *uniqueIdentifier;
  NSUUID *v11;
  NSUUID *loggingUniqueIdentifier;
  NSString *v13;
  NSString *name;
  NSString *v15;
  NSString *model;
  NSString *v17;
  NSString *roomName;
  NSString *v19;
  NSString *assistantIdentifier;
  NSString *v21;
  NSString *manufacturer;
  NSString *v23;
  NSString *categoryType;
  BOOL v25;
  NSString *v27;

  v4 = (AFHomeAccessoryInfo *)a3;
  if (self == v4)
  {
    v25 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      isSpeaker = self->_isSpeaker;
      if (isSpeaker == -[AFHomeAccessoryInfo isSpeaker](v5, "isSpeaker")
        && (hasActiveThirdPartyMusicSubscription = self->_hasActiveThirdPartyMusicSubscription,
            hasActiveThirdPartyMusicSubscription == -[AFHomeAccessoryInfo hasActiveThirdPartyMusicSubscription](v5, "hasActiveThirdPartyMusicSubscription"))&& (schemaCategoryType = self->_schemaCategoryType, schemaCategoryType == -[AFHomeAccessoryInfo schemaCategoryType](v5, "schemaCategoryType")))
      {
        -[AFHomeAccessoryInfo uniqueIdentifier](v5, "uniqueIdentifier");
        v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        uniqueIdentifier = self->_uniqueIdentifier;
        if (uniqueIdentifier == v9 || -[NSUUID isEqual:](uniqueIdentifier, "isEqual:", v9))
        {
          -[AFHomeAccessoryInfo loggingUniqueIdentifier](v5, "loggingUniqueIdentifier");
          v11 = (NSUUID *)objc_claimAutoreleasedReturnValue();
          loggingUniqueIdentifier = self->_loggingUniqueIdentifier;
          if (loggingUniqueIdentifier == v11
            || -[NSUUID isEqual:](loggingUniqueIdentifier, "isEqual:", v11))
          {
            -[AFHomeAccessoryInfo name](v5, "name");
            v13 = (NSString *)objc_claimAutoreleasedReturnValue();
            name = self->_name;
            if (name == v13 || -[NSString isEqual:](name, "isEqual:", v13))
            {
              -[AFHomeAccessoryInfo model](v5, "model");
              v15 = (NSString *)objc_claimAutoreleasedReturnValue();
              model = self->_model;
              if (model == v15 || -[NSString isEqual:](model, "isEqual:", v15))
              {
                -[AFHomeAccessoryInfo roomName](v5, "roomName");
                v17 = (NSString *)objc_claimAutoreleasedReturnValue();
                roomName = self->_roomName;
                if (roomName == v17 || -[NSString isEqual:](roomName, "isEqual:", v17))
                {
                  -[AFHomeAccessoryInfo assistantIdentifier](v5, "assistantIdentifier");
                  v19 = (NSString *)objc_claimAutoreleasedReturnValue();
                  assistantIdentifier = self->_assistantIdentifier;
                  if (assistantIdentifier == v19
                    || -[NSString isEqual:](assistantIdentifier, "isEqual:", v19))
                  {
                    -[AFHomeAccessoryInfo manufacturer](v5, "manufacturer");
                    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
                    manufacturer = self->_manufacturer;
                    if (manufacturer == v21 || -[NSString isEqual:](manufacturer, "isEqual:", v21))
                    {
                      v27 = v21;
                      -[AFHomeAccessoryInfo categoryType](v5, "categoryType");
                      v23 = (NSString *)objc_claimAutoreleasedReturnValue();
                      categoryType = self->_categoryType;
                      v25 = categoryType == v23 || -[NSString isEqual:](categoryType, "isEqual:", v23);

                      v21 = v27;
                    }
                    else
                    {
                      v25 = 0;
                    }

                  }
                  else
                  {
                    v25 = 0;
                  }

                }
                else
                {
                  v25 = 0;
                }

              }
              else
              {
                v25 = 0;
              }

            }
            else
            {
              v25 = 0;
            }

          }
          else
          {
            v25 = 0;
          }

        }
        else
        {
          v25 = 0;
        }

      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }
  }

  return v25;
}

- (AFHomeAccessoryInfo)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  AFHomeAccessoryInfo *v15;
  uint64_t v17;
  void *v18;
  void *v19;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessoryInfo::uniqueIdentifier"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessoryInfo::loggingUniqueIdentifier"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessoryInfo::name"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessoryInfo::model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessoryInfo::roomName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessoryInfo::assistantIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessoryInfo::isSpeaker"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessoryInfo::hasActiveThirdPartyMusicSubscription"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v10, "BOOLValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessoryInfo::manufacturer"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessoryInfo::categoryType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFHomeAccessoryInfo::schemaCategoryType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "integerValue");
  BYTE1(v17) = (_BYTE)v8;
  LOBYTE(v17) = v9;
  v15 = -[AFHomeAccessoryInfo initWithUniqueIdentifier:loggingUniqueIdentifier:name:model:roomName:assistantIdentifier:isSpeaker:hasActiveThirdPartyMusicSubscription:manufacturer:categoryType:schemaCategoryType:](self, "initWithUniqueIdentifier:loggingUniqueIdentifier:name:model:roomName:assistantIdentifier:isSpeaker:hasActiveThirdPartyMusicSubscription:manufacturer:categoryType:schemaCategoryType:", v19, v18, v4, v5, v6, v7, v17, v11, v12, v14);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *uniqueIdentifier;
  id v5;
  void *v6;
  void *v7;
  id v8;

  uniqueIdentifier = self->_uniqueIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueIdentifier, CFSTR("AFHomeAccessoryInfo::uniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_loggingUniqueIdentifier, CFSTR("AFHomeAccessoryInfo::loggingUniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("AFHomeAccessoryInfo::name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_model, CFSTR("AFHomeAccessoryInfo::model"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_roomName, CFSTR("AFHomeAccessoryInfo::roomName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assistantIdentifier, CFSTR("AFHomeAccessoryInfo::assistantIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSpeaker);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("AFHomeAccessoryInfo::isSpeaker"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasActiveThirdPartyMusicSubscription);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("AFHomeAccessoryInfo::hasActiveThirdPartyMusicSubscription"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_manufacturer, CFSTR("AFHomeAccessoryInfo::manufacturer"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categoryType, CFSTR("AFHomeAccessoryInfo::categoryType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_schemaCategoryType);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("AFHomeAccessoryInfo::schemaCategoryType"));

}

- (AFHomeAccessoryInfo)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AFHomeAccessoryInfo *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  char v16;
  void *v17;
  id v18;
  char v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("uniqueIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v33 = v6;
    else
      v33 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("loggingUniqueIdentifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v32 = v8;
    else
      v32 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("name"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v31 = v9;
    else
      v31 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("model"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v30 = v10;
    else
      v30 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("roomName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v29 = v11;
    else
      v29 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("assistantIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("isSpeaker"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v14;
    else
      v15 = 0;

    v16 = objc_msgSend(v15, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("hasActiveThirdPartyMusicSubscription"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v18 = v17;
    else
      v18 = 0;

    v19 = objc_msgSend(v18, "BOOLValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("manufacturer"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v21 = v20;
    else
      v21 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("categoryType"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v23 = v22;
    else
      v23 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("schemaCategoryType"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v24;
    else
      v25 = 0;

    v26 = objc_msgSend(v25, "integerValue");
    BYTE1(v28) = v19;
    LOBYTE(v28) = v16;
    self = -[AFHomeAccessoryInfo initWithUniqueIdentifier:loggingUniqueIdentifier:name:model:roomName:assistantIdentifier:isSpeaker:hasActiveThirdPartyMusicSubscription:manufacturer:categoryType:schemaCategoryType:](self, "initWithUniqueIdentifier:loggingUniqueIdentifier:name:model:roomName:assistantIdentifier:isSpeaker:hasActiveThirdPartyMusicSubscription:manufacturer:categoryType:schemaCategoryType:", v33, v32, v31, v30, v29, v13, v28, v21, v23, v26);

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
  NSUUID *uniqueIdentifier;
  NSUUID *loggingUniqueIdentifier;
  NSString *name;
  NSString *model;
  NSString *roomName;
  NSString *assistantIdentifier;
  void *v11;
  void *v12;
  NSString *manufacturer;
  NSString *categoryType;
  void *v15;
  void *v16;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
    objc_msgSend(v3, "setObject:forKey:", uniqueIdentifier, CFSTR("uniqueIdentifier"));
  loggingUniqueIdentifier = self->_loggingUniqueIdentifier;
  if (loggingUniqueIdentifier)
    objc_msgSend(v4, "setObject:forKey:", loggingUniqueIdentifier, CFSTR("loggingUniqueIdentifier"));
  name = self->_name;
  if (name)
    objc_msgSend(v4, "setObject:forKey:", name, CFSTR("name"));
  model = self->_model;
  if (model)
    objc_msgSend(v4, "setObject:forKey:", model, CFSTR("model"));
  roomName = self->_roomName;
  if (roomName)
    objc_msgSend(v4, "setObject:forKey:", roomName, CFSTR("roomName"));
  assistantIdentifier = self->_assistantIdentifier;
  if (assistantIdentifier)
    objc_msgSend(v4, "setObject:forKey:", assistantIdentifier, CFSTR("assistantIdentifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSpeaker);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("isSpeaker"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_hasActiveThirdPartyMusicSubscription);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v12, CFSTR("hasActiveThirdPartyMusicSubscription"));

  manufacturer = self->_manufacturer;
  if (manufacturer)
    objc_msgSend(v4, "setObject:forKey:", manufacturer, CFSTR("manufacturer"));
  categoryType = self->_categoryType;
  if (categoryType)
    objc_msgSend(v4, "setObject:forKey:", categoryType, CFSTR("categoryType"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_schemaCategoryType);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v15, CFSTR("schemaCategoryType"));

  v16 = (void *)objc_msgSend(v4, "copy");
  return v16;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSUUID)loggingUniqueIdentifier
{
  return self->_loggingUniqueIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (BOOL)isSpeaker
{
  return self->_isSpeaker;
}

- (BOOL)hasActiveThirdPartyMusicSubscription
{
  return self->_hasActiveThirdPartyMusicSubscription;
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)categoryType
{
  return self->_categoryType;
}

- (int64_t)schemaCategoryType
{
  return self->_schemaCategoryType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoryType, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_loggingUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

void __204__AFHomeAccessoryInfo_initWithUniqueIdentifier_loggingUniqueIdentifier_name_model_roomName_assistantIdentifier_isSpeaker_hasActiveThirdPartyMusicSubscription_manufacturer_categoryType_schemaCategoryType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setUniqueIdentifier:", v3);
  objc_msgSend(v4, "setLoggingUniqueIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v4, "setName:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v4, "setModel:", *(_QWORD *)(a1 + 56));
  objc_msgSend(v4, "setRoomName:", *(_QWORD *)(a1 + 64));
  objc_msgSend(v4, "setAssistantIdentifier:", *(_QWORD *)(a1 + 72));
  objc_msgSend(v4, "setIsSpeaker:", *(unsigned __int8 *)(a1 + 104));
  objc_msgSend(v4, "setHasActiveThirdPartyMusicSubscription:", *(unsigned __int8 *)(a1 + 105));
  objc_msgSend(v4, "setManufacturer:", *(_QWORD *)(a1 + 80));
  objc_msgSend(v4, "setCategoryType:", *(_QWORD *)(a1 + 88));
  objc_msgSend(v4, "setSchemaCategoryType:", *(_QWORD *)(a1 + 96));

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
  void (**v4)(id, _AFHomeAccessoryInfoMutation *);
  _AFHomeAccessoryInfoMutation *v5;
  AFHomeAccessoryInfo *v6;
  void *v7;
  uint64_t v8;
  NSUUID *uniqueIdentifier;
  void *v10;
  uint64_t v11;
  NSUUID *loggingUniqueIdentifier;
  void *v13;
  uint64_t v14;
  NSString *name;
  void *v16;
  uint64_t v17;
  NSString *model;
  void *v19;
  uint64_t v20;
  NSString *roomName;
  void *v22;
  uint64_t v23;
  NSString *assistantIdentifier;
  void *v25;
  uint64_t v26;
  NSString *manufacturer;
  void *v28;
  uint64_t v29;
  NSString *categoryType;

  v4 = (void (**)(id, _AFHomeAccessoryInfoMutation *))a3;
  if (v4)
  {
    v5 = -[_AFHomeAccessoryInfoMutation initWithBase:]([_AFHomeAccessoryInfoMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFHomeAccessoryInfoMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFHomeAccessoryInfo);
      -[_AFHomeAccessoryInfoMutation getUniqueIdentifier](v5, "getUniqueIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      uniqueIdentifier = v6->_uniqueIdentifier;
      v6->_uniqueIdentifier = (NSUUID *)v8;

      -[_AFHomeAccessoryInfoMutation getLoggingUniqueIdentifier](v5, "getLoggingUniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      loggingUniqueIdentifier = v6->_loggingUniqueIdentifier;
      v6->_loggingUniqueIdentifier = (NSUUID *)v11;

      -[_AFHomeAccessoryInfoMutation getName](v5, "getName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      name = v6->_name;
      v6->_name = (NSString *)v14;

      -[_AFHomeAccessoryInfoMutation getModel](v5, "getModel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      model = v6->_model;
      v6->_model = (NSString *)v17;

      -[_AFHomeAccessoryInfoMutation getRoomName](v5, "getRoomName");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      roomName = v6->_roomName;
      v6->_roomName = (NSString *)v20;

      -[_AFHomeAccessoryInfoMutation getAssistantIdentifier](v5, "getAssistantIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      assistantIdentifier = v6->_assistantIdentifier;
      v6->_assistantIdentifier = (NSString *)v23;

      v6->_isSpeaker = -[_AFHomeAccessoryInfoMutation getIsSpeaker](v5, "getIsSpeaker");
      v6->_hasActiveThirdPartyMusicSubscription = -[_AFHomeAccessoryInfoMutation getHasActiveThirdPartyMusicSubscription](v5, "getHasActiveThirdPartyMusicSubscription");
      -[_AFHomeAccessoryInfoMutation getManufacturer](v5, "getManufacturer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      manufacturer = v6->_manufacturer;
      v6->_manufacturer = (NSString *)v26;

      -[_AFHomeAccessoryInfoMutation getCategoryType](v5, "getCategoryType");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "copy");
      categoryType = v6->_categoryType;
      v6->_categoryType = (NSString *)v29;

      v6->_schemaCategoryType = -[_AFHomeAccessoryInfoMutation getSchemaCategoryType](v5, "getSchemaCategoryType");
    }
    else
    {
      v6 = (AFHomeAccessoryInfo *)-[AFHomeAccessoryInfo copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFHomeAccessoryInfo *)-[AFHomeAccessoryInfo copy](self, "copy");
  }

  return v6;
}

@end
