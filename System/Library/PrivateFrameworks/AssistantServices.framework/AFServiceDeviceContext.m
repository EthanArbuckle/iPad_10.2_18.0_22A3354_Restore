@implementation AFServiceDeviceContext

- (AFServiceDeviceContext)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFServiceDeviceContextMutation *);
  AFServiceDeviceContext *v5;
  AFServiceDeviceContext *v6;
  _AFServiceDeviceContextMutation *v7;
  void *v8;
  uint64_t v9;
  NSUUID *identifier;
  void *v11;
  uint64_t v12;
  NSString *assistantIdentifier;
  void *v14;
  uint64_t v15;
  NSString *mediaSystemIdentifier;
  void *v17;
  uint64_t v18;
  NSString *mediaRouteIdentifier;
  void *v20;
  uint64_t v21;
  NSString *sharedUserID;
  void *v23;
  uint64_t v24;
  NSString *roomName;
  void *v26;
  uint64_t v27;
  NSDictionary *serializedContextByKey;
  void *v29;
  uint64_t v30;
  NSDictionary *metricsContext;
  objc_super v33;

  v4 = (void (**)(id, _AFServiceDeviceContextMutation *))a3;
  v33.receiver = self;
  v33.super_class = (Class)AFServiceDeviceContext;
  v5 = -[AFServiceDeviceContext init](&v33, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFServiceDeviceContextMutation initWithBase:]([_AFServiceDeviceContextMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFServiceDeviceContextMutation isDirty](v7, "isDirty"))
    {
      -[_AFServiceDeviceContextMutation getIdentifier](v7, "getIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      identifier = v6->_identifier;
      v6->_identifier = (NSUUID *)v9;

      -[_AFServiceDeviceContextMutation getAssistantIdentifier](v7, "getAssistantIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      assistantIdentifier = v6->_assistantIdentifier;
      v6->_assistantIdentifier = (NSString *)v12;

      -[_AFServiceDeviceContextMutation getMediaSystemIdentifier](v7, "getMediaSystemIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "copy");
      mediaSystemIdentifier = v6->_mediaSystemIdentifier;
      v6->_mediaSystemIdentifier = (NSString *)v15;

      -[_AFServiceDeviceContextMutation getMediaRouteIdentifier](v7, "getMediaRouteIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "copy");
      mediaRouteIdentifier = v6->_mediaRouteIdentifier;
      v6->_mediaRouteIdentifier = (NSString *)v18;

      -[_AFServiceDeviceContextMutation getSharedUserID](v7, "getSharedUserID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      sharedUserID = v6->_sharedUserID;
      v6->_sharedUserID = (NSString *)v21;

      -[_AFServiceDeviceContextMutation getRoomName](v7, "getRoomName");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "copy");
      roomName = v6->_roomName;
      v6->_roomName = (NSString *)v24;

      v6->_proximity = -[_AFServiceDeviceContextMutation getProximity](v7, "getProximity");
      -[_AFServiceDeviceContextMutation getSerializedContextByKey](v7, "getSerializedContextByKey");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "copy");
      serializedContextByKey = v6->_serializedContextByKey;
      v6->_serializedContextByKey = (NSDictionary *)v27;

      -[_AFServiceDeviceContextMutation getMetricsContext](v7, "getMetricsContext");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "copy");
      metricsContext = v6->_metricsContext;
      v6->_metricsContext = (NSDictionary *)v30;

    }
  }

  return v6;
}

- (AFServiceDeviceContext)init
{
  return -[AFServiceDeviceContext initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFServiceDeviceContext)initWithIdentifier:(id)a3 assistantIdentifier:(id)a4 mediaSystemIdentifier:(id)a5 mediaRouteIdentifier:(id)a6 sharedUserID:(id)a7 roomName:(id)a8 proximity:(int64_t)a9 serializedContextByKey:(id)a10 metricsContext:(id)a11
{
  id v16;
  id v17;
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
  AFServiceDeviceContext *v32;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  int64_t v44;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a10;
  v23 = a11;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __178__AFServiceDeviceContext_initWithIdentifier_assistantIdentifier_mediaSystemIdentifier_mediaRouteIdentifier_sharedUserID_roomName_proximity_serializedContextByKey_metricsContext___block_invoke;
  v35[3] = &unk_1E3A321C8;
  v36 = v16;
  v37 = v17;
  v38 = v18;
  v39 = v19;
  v40 = v20;
  v41 = v21;
  v43 = v23;
  v44 = a9;
  v42 = v22;
  v24 = v23;
  v25 = v22;
  v26 = v21;
  v27 = v20;
  v28 = v19;
  v29 = v18;
  v30 = v17;
  v31 = v16;
  v32 = -[AFServiceDeviceContext initWithBuilder:](self, "initWithBuilder:", v35);

  return v32;
}

- (id)description
{
  return -[AFServiceDeviceContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v8.receiver = self;
  v8.super_class = (Class)AFServiceDeviceContext;
  -[AFServiceDeviceContext description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {identifier = %@, assistantIdentifier = %@, mediaSystemIdentifier = %@, mediaRouteIdentifier = %@, sharedUserID = %@, roomName = %@, proximity = %lld, serializedContextByKey = %@, metricsContext = %@}"), v5, self->_identifier, self->_assistantIdentifier, self->_mediaSystemIdentifier, self->_mediaRouteIdentifier, self->_sharedUserID, self->_roomName, self->_proximity, self->_serializedContextByKey, self->_metricsContext);

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;

  v3 = -[NSUUID hash](self->_identifier, "hash");
  v4 = -[NSString hash](self->_assistantIdentifier, "hash") ^ v3;
  v5 = -[NSString hash](self->_mediaSystemIdentifier, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_mediaRouteIdentifier, "hash");
  v7 = -[NSString hash](self->_sharedUserID, "hash");
  v8 = v6 ^ v7 ^ -[NSString hash](self->_roomName, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_proximity);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");
  v11 = v8 ^ v10 ^ -[NSDictionary hash](self->_serializedContextByKey, "hash");
  v12 = v11 ^ -[NSDictionary hash](self->_metricsContext, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  AFServiceDeviceContext *v4;
  AFServiceDeviceContext *v5;
  int64_t proximity;
  NSUUID *v7;
  NSUUID *identifier;
  NSString *v9;
  NSString *assistantIdentifier;
  NSString *v11;
  NSString *mediaSystemIdentifier;
  NSString *v13;
  NSString *mediaRouteIdentifier;
  NSString *v15;
  NSString *sharedUserID;
  NSString *v17;
  NSString *roomName;
  NSDictionary *v19;
  NSDictionary *serializedContextByKey;
  NSDictionary *v21;
  NSDictionary *metricsContext;
  BOOL v23;
  NSDictionary *v25;

  v4 = (AFServiceDeviceContext *)a3;
  if (self == v4)
  {
    v23 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      proximity = self->_proximity;
      if (proximity == -[AFServiceDeviceContext proximity](v5, "proximity"))
      {
        -[AFServiceDeviceContext identifier](v5, "identifier");
        v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
        identifier = self->_identifier;
        if (identifier == v7 || -[NSUUID isEqual:](identifier, "isEqual:", v7))
        {
          -[AFServiceDeviceContext assistantIdentifier](v5, "assistantIdentifier");
          v9 = (NSString *)objc_claimAutoreleasedReturnValue();
          assistantIdentifier = self->_assistantIdentifier;
          if (assistantIdentifier == v9 || -[NSString isEqual:](assistantIdentifier, "isEqual:", v9))
          {
            -[AFServiceDeviceContext mediaSystemIdentifier](v5, "mediaSystemIdentifier");
            v11 = (NSString *)objc_claimAutoreleasedReturnValue();
            mediaSystemIdentifier = self->_mediaSystemIdentifier;
            if (mediaSystemIdentifier == v11
              || -[NSString isEqual:](mediaSystemIdentifier, "isEqual:", v11))
            {
              -[AFServiceDeviceContext mediaRouteIdentifier](v5, "mediaRouteIdentifier");
              v13 = (NSString *)objc_claimAutoreleasedReturnValue();
              mediaRouteIdentifier = self->_mediaRouteIdentifier;
              if (mediaRouteIdentifier == v13
                || -[NSString isEqual:](mediaRouteIdentifier, "isEqual:", v13))
              {
                -[AFServiceDeviceContext sharedUserID](v5, "sharedUserID");
                v15 = (NSString *)objc_claimAutoreleasedReturnValue();
                sharedUserID = self->_sharedUserID;
                if (sharedUserID == v15 || -[NSString isEqual:](sharedUserID, "isEqual:", v15))
                {
                  -[AFServiceDeviceContext roomName](v5, "roomName");
                  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
                  roomName = self->_roomName;
                  if (roomName == v17 || -[NSString isEqual:](roomName, "isEqual:", v17))
                  {
                    -[AFServiceDeviceContext serializedContextByKey](v5, "serializedContextByKey");
                    v19 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
                    serializedContextByKey = self->_serializedContextByKey;
                    if (serializedContextByKey == v19
                      || -[NSDictionary isEqual:](serializedContextByKey, "isEqual:", v19))
                    {
                      v25 = v19;
                      -[AFServiceDeviceContext metricsContext](v5, "metricsContext");
                      v21 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
                      metricsContext = self->_metricsContext;
                      v23 = metricsContext == v21
                         || -[NSDictionary isEqual:](metricsContext, "isEqual:", v21);

                      v19 = v25;
                    }
                    else
                    {
                      v23 = 0;
                    }

                  }
                  else
                  {
                    v23 = 0;
                  }

                }
                else
                {
                  v23 = 0;
                }

              }
              else
              {
                v23 = 0;
              }

            }
            else
            {
              v23 = 0;
            }

          }
          else
          {
            v23 = 0;
          }

        }
        else
        {
          v23 = 0;
        }

      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

- (AFServiceDeviceContext)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  AFServiceDeviceContext *v26;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFServiceDeviceContext::identifier"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFServiceDeviceContext::assistantIdentifier"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFServiceDeviceContext::mediaSystemIdentifier"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFServiceDeviceContext::mediaRouteIdentifier"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFServiceDeviceContext::sharedUserID"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFServiceDeviceContext::roomName"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFServiceDeviceContext::proximity"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v4, "integerValue");

  v31 = (void *)MEMORY[0x1E0C99E60];
  v29 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v31, "setWithObjects:", v29, v5, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v14, CFSTR("AFServiceDeviceContext::serializedContextByKey"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)MEMORY[0x1E0C99E60];
  v28 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  v18 = objc_opt_class();
  v19 = objc_opt_class();
  v20 = objc_opt_class();
  v21 = objc_opt_class();
  v22 = objc_opt_class();
  v23 = objc_opt_class();
  objc_msgSend(v30, "setWithObjects:", v28, v15, v16, v17, v18, v19, v20, v21, v22, v23, objc_opt_class(), 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v24, CFSTR("AFServiceDeviceContext::metricsContext"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[AFServiceDeviceContext initWithIdentifier:assistantIdentifier:mediaSystemIdentifier:mediaRouteIdentifier:sharedUserID:roomName:proximity:serializedContextByKey:metricsContext:](self, "initWithIdentifier:assistantIdentifier:mediaSystemIdentifier:mediaRouteIdentifier:sharedUserID:roomName:proximity:serializedContextByKey:metricsContext:", v39, v38, v37, v36, v35, v34, v33, v32, v25);
  return v26;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  void *v5;
  id v6;

  identifier = self->_identifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", identifier, CFSTR("AFServiceDeviceContext::identifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_assistantIdentifier, CFSTR("AFServiceDeviceContext::assistantIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_mediaSystemIdentifier, CFSTR("AFServiceDeviceContext::mediaSystemIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_mediaRouteIdentifier, CFSTR("AFServiceDeviceContext::mediaRouteIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sharedUserID, CFSTR("AFServiceDeviceContext::sharedUserID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_roomName, CFSTR("AFServiceDeviceContext::roomName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_proximity);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("AFServiceDeviceContext::proximity"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_serializedContextByKey, CFSTR("AFServiceDeviceContext::serializedContextByKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_metricsContext, CFSTR("AFServiceDeviceContext::metricsContext"));

}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (NSString)assistantIdentifier
{
  return self->_assistantIdentifier;
}

- (NSString)mediaSystemIdentifier
{
  return self->_mediaSystemIdentifier;
}

- (NSString)mediaRouteIdentifier
{
  return self->_mediaRouteIdentifier;
}

- (NSString)sharedUserID
{
  return self->_sharedUserID;
}

- (NSString)roomName
{
  return self->_roomName;
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (NSDictionary)serializedContextByKey
{
  return self->_serializedContextByKey;
}

- (NSDictionary)metricsContext
{
  return self->_metricsContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsContext, 0);
  objc_storeStrong((id *)&self->_serializedContextByKey, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_sharedUserID, 0);
  objc_storeStrong((id *)&self->_mediaRouteIdentifier, 0);
  objc_storeStrong((id *)&self->_mediaSystemIdentifier, 0);
  objc_storeStrong((id *)&self->_assistantIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __178__AFServiceDeviceContext_initWithIdentifier_assistantIdentifier_mediaSystemIdentifier_mediaRouteIdentifier_sharedUserID_roomName_proximity_serializedContextByKey_metricsContext___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[4];
  v4 = a2;
  objc_msgSend(v4, "setIdentifier:", v3);
  objc_msgSend(v4, "setAssistantIdentifier:", a1[5]);
  objc_msgSend(v4, "setMediaSystemIdentifier:", a1[6]);
  objc_msgSend(v4, "setMediaRouteIdentifier:", a1[7]);
  objc_msgSend(v4, "setSharedUserID:", a1[8]);
  objc_msgSend(v4, "setRoomName:", a1[9]);
  objc_msgSend(v4, "setProximity:", a1[12]);
  objc_msgSend(v4, "setSerializedContextByKey:", a1[10]);
  objc_msgSend(v4, "setMetricsContext:", a1[11]);

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
  void (**v4)(id, _AFServiceDeviceContextMutation *);
  _AFServiceDeviceContextMutation *v5;
  AFServiceDeviceContext *v6;
  void *v7;
  uint64_t v8;
  NSUUID *identifier;
  void *v10;
  uint64_t v11;
  NSString *assistantIdentifier;
  void *v13;
  uint64_t v14;
  NSString *mediaSystemIdentifier;
  void *v16;
  uint64_t v17;
  NSString *mediaRouteIdentifier;
  void *v19;
  uint64_t v20;
  NSString *sharedUserID;
  void *v22;
  uint64_t v23;
  NSString *roomName;
  void *v25;
  uint64_t v26;
  NSDictionary *serializedContextByKey;
  void *v28;
  uint64_t v29;
  NSDictionary *metricsContext;

  v4 = (void (**)(id, _AFServiceDeviceContextMutation *))a3;
  if (v4)
  {
    v5 = -[_AFServiceDeviceContextMutation initWithBase:]([_AFServiceDeviceContextMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFServiceDeviceContextMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFServiceDeviceContext);
      -[_AFServiceDeviceContextMutation getIdentifier](v5, "getIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      identifier = v6->_identifier;
      v6->_identifier = (NSUUID *)v8;

      -[_AFServiceDeviceContextMutation getAssistantIdentifier](v5, "getAssistantIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      assistantIdentifier = v6->_assistantIdentifier;
      v6->_assistantIdentifier = (NSString *)v11;

      -[_AFServiceDeviceContextMutation getMediaSystemIdentifier](v5, "getMediaSystemIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      mediaSystemIdentifier = v6->_mediaSystemIdentifier;
      v6->_mediaSystemIdentifier = (NSString *)v14;

      -[_AFServiceDeviceContextMutation getMediaRouteIdentifier](v5, "getMediaRouteIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "copy");
      mediaRouteIdentifier = v6->_mediaRouteIdentifier;
      v6->_mediaRouteIdentifier = (NSString *)v17;

      -[_AFServiceDeviceContextMutation getSharedUserID](v5, "getSharedUserID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "copy");
      sharedUserID = v6->_sharedUserID;
      v6->_sharedUserID = (NSString *)v20;

      -[_AFServiceDeviceContextMutation getRoomName](v5, "getRoomName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "copy");
      roomName = v6->_roomName;
      v6->_roomName = (NSString *)v23;

      v6->_proximity = -[_AFServiceDeviceContextMutation getProximity](v5, "getProximity");
      -[_AFServiceDeviceContextMutation getSerializedContextByKey](v5, "getSerializedContextByKey");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "copy");
      serializedContextByKey = v6->_serializedContextByKey;
      v6->_serializedContextByKey = (NSDictionary *)v26;

      -[_AFServiceDeviceContextMutation getMetricsContext](v5, "getMetricsContext");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "copy");
      metricsContext = v6->_metricsContext;
      v6->_metricsContext = (NSDictionary *)v29;

    }
    else
    {
      v6 = (AFServiceDeviceContext *)-[AFServiceDeviceContext copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFServiceDeviceContext *)-[AFServiceDeviceContext copy](self, "copy");
  }

  return v6;
}

@end
