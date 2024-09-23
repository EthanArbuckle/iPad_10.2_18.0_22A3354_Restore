@implementation ATXNotificationDeliverySuggestion

- (ATXNotificationDeliverySuggestion)initWithSmartPauseSuggestion:(id)a3 uuid:(id)a4 scope:(int64_t)a5 entityIdentifier:(id)a6 timestamp:(id)a7 triggerNotificationUUID:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ATXNotificationDeliverySuggestion *v20;
  uint64_t v21;
  NSUUID *uuid;
  uint64_t v23;
  NSString *entityIdentifier;
  uint64_t v25;
  NSUUID *triggerNotificationUUID;
  objc_super v28;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)ATXNotificationDeliverySuggestion;
  v20 = -[ATXNotificationDeliverySuggestion init](&v28, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v16, "copy");
    uuid = v20->_uuid;
    v20->_uuid = (NSUUID *)v21;

    v20->_scope = a5;
    v23 = objc_msgSend(v17, "copy");
    entityIdentifier = v20->_entityIdentifier;
    v20->_entityIdentifier = (NSString *)v23;

    objc_storeStrong((id *)&v20->_timestamp, a7);
    v25 = objc_msgSend(v19, "copy");
    triggerNotificationUUID = v20->_triggerNotificationUUID;
    v20->_triggerNotificationUUID = (NSUUID *)v25;

    v20->_subtype = 4;
    objc_storeStrong(&v20->_subObject, a3);
  }

  return v20;
}

- (id)initQuietingSuggestionWithUUID:(id)a3 scope:(int64_t)a4 entityIdentifier:(id)a5 timestamp:(id)a6 triggerNotificationUUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ATXNotificationDeliverySuggestion *v16;
  uint64_t v17;
  NSUUID *uuid;
  uint64_t v19;
  NSString *entityIdentifier;
  uint64_t v21;
  NSUUID *triggerNotificationUUID;
  id subObject;
  objc_super v25;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)ATXNotificationDeliverySuggestion;
  v16 = -[ATXNotificationDeliverySuggestion init](&v25, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    uuid = v16->_uuid;
    v16->_uuid = (NSUUID *)v17;

    v16->_scope = a4;
    v19 = objc_msgSend(v13, "copy");
    entityIdentifier = v16->_entityIdentifier;
    v16->_entityIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v16->_timestamp, a6);
    v21 = objc_msgSend(v15, "copy");
    triggerNotificationUUID = v16->_triggerNotificationUUID;
    v16->_triggerNotificationUUID = (NSUUID *)v21;

    subObject = v16->_subObject;
    v16->_subtype = 1;
    v16->_subObject = 0;

  }
  return v16;
}

- (id)initPromotingSuggestionWithUUID:(id)a3 scope:(int64_t)a4 entityIdentifier:(id)a5 timestamp:(id)a6 triggerNotificationUUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ATXNotificationDeliverySuggestion *v16;
  uint64_t v17;
  NSUUID *uuid;
  uint64_t v19;
  NSString *entityIdentifier;
  uint64_t v21;
  NSUUID *triggerNotificationUUID;
  id subObject;
  objc_super v25;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v25.receiver = self;
  v25.super_class = (Class)ATXNotificationDeliverySuggestion;
  v16 = -[ATXNotificationDeliverySuggestion init](&v25, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    uuid = v16->_uuid;
    v16->_uuid = (NSUUID *)v17;

    v16->_scope = a4;
    v19 = objc_msgSend(v13, "copy");
    entityIdentifier = v16->_entityIdentifier;
    v16->_entityIdentifier = (NSString *)v19;

    objc_storeStrong((id *)&v16->_timestamp, a6);
    v21 = objc_msgSend(v15, "copy");
    triggerNotificationUUID = v16->_triggerNotificationUUID;
    v16->_triggerNotificationUUID = (NSUUID *)v21;

    subObject = v16->_subObject;
    v16->_subtype = 2;
    v16->_subObject = 0;

  }
  return v16;
}

- (ATXNotificationDeliverySuggestion)initWithInterruptionManagerTuningSuggestion:(id)a3 scope:(int64_t)a4 entityIdentifier:(id)a5 uuid:(id)a6 timestamp:(id)a7 triggerNotificationUUID:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ATXNotificationDeliverySuggestion *v20;
  uint64_t v21;
  NSUUID *uuid;
  uint64_t v23;
  NSString *entityIdentifier;
  uint64_t v25;
  NSUUID *triggerNotificationUUID;
  objc_super v28;

  v15 = a3;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v28.receiver = self;
  v28.super_class = (Class)ATXNotificationDeliverySuggestion;
  v20 = -[ATXNotificationDeliverySuggestion init](&v28, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v17, "copy");
    uuid = v20->_uuid;
    v20->_uuid = (NSUUID *)v21;

    v20->_scope = a4;
    v23 = objc_msgSend(v16, "copy");
    entityIdentifier = v20->_entityIdentifier;
    v20->_entityIdentifier = (NSString *)v23;

    objc_storeStrong((id *)&v20->_timestamp, a7);
    v25 = objc_msgSend(v19, "copy");
    triggerNotificationUUID = v20->_triggerNotificationUUID;
    v20->_triggerNotificationUUID = (NSUUID *)v25;

    v20->_subtype = 5;
    objc_storeStrong(&v20->_subObject, a3);
  }

  return v20;
}

- (id)initSendToDigestSuggestionWithUUID:(id)a3 bundleID:(id)a4 timestamp:(id)a5 triggerNotificationUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ATXNotificationDeliverySuggestion *v14;
  uint64_t v15;
  NSUUID *uuid;
  uint64_t v17;
  NSString *entityIdentifier;
  uint64_t v19;
  NSUUID *triggerNotificationUUID;
  uint64_t v21;
  id subObject;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ATXNotificationDeliverySuggestion;
  v14 = -[ATXNotificationDeliverySuggestion init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v15;

    v14->_scope = 1;
    v17 = objc_msgSend(v11, "copy");
    entityIdentifier = v14->_entityIdentifier;
    v14->_entityIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v14->_timestamp, a5);
    v19 = objc_msgSend(v13, "copy");
    triggerNotificationUUID = v14->_triggerNotificationUUID;
    v14->_triggerNotificationUUID = (NSUUID *)v19;

    v14->_subtype = 6;
    v21 = objc_opt_new();
    subObject = v14->_subObject;
    v14->_subObject = (id)v21;

  }
  return v14;
}

- (id)initSendToMessagesDigestSuggestionWithUUID:(id)a3 bundleID:(id)a4 timestamp:(id)a5 triggerNotificationUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ATXNotificationDeliverySuggestion *v14;
  uint64_t v15;
  NSUUID *uuid;
  uint64_t v17;
  NSString *entityIdentifier;
  uint64_t v19;
  NSUUID *triggerNotificationUUID;
  uint64_t v21;
  id subObject;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ATXNotificationDeliverySuggestion;
  v14 = -[ATXNotificationDeliverySuggestion init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v15;

    v14->_scope = 1;
    v17 = objc_msgSend(v11, "copy");
    entityIdentifier = v14->_entityIdentifier;
    v14->_entityIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v14->_timestamp, a5);
    v19 = objc_msgSend(v13, "copy");
    triggerNotificationUUID = v14->_triggerNotificationUUID;
    v14->_triggerNotificationUUID = (NSUUID *)v19;

    v14->_subtype = 8;
    v21 = objc_opt_new();
    subObject = v14->_subObject;
    v14->_subObject = (id)v21;

  }
  return v14;
}

- (id)initUrgencyTuningSuggestionWithUUID:(id)a3 bundleID:(id)a4 timestamp:(id)a5 triggerNotificationUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ATXNotificationDeliverySuggestion *v14;
  uint64_t v15;
  NSUUID *uuid;
  uint64_t v17;
  NSString *entityIdentifier;
  uint64_t v19;
  NSUUID *triggerNotificationUUID;
  uint64_t v21;
  id subObject;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)ATXNotificationDeliverySuggestion;
  v14 = -[ATXNotificationDeliverySuggestion init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v15;

    v14->_scope = 1;
    v17 = objc_msgSend(v11, "copy");
    entityIdentifier = v14->_entityIdentifier;
    v14->_entityIdentifier = (NSString *)v17;

    objc_storeStrong((id *)&v14->_timestamp, a5);
    v19 = objc_msgSend(v13, "copy");
    triggerNotificationUUID = v14->_triggerNotificationUUID;
    v14->_triggerNotificationUUID = (NSUUID *)v19;

    v14->_subtype = 7;
    v21 = objc_opt_new();
    subObject = v14->_subObject;
    v14->_subObject = (id)v21;

  }
  return v14;
}

- (id)initTurnOffNotificationsForAppSuggestionWithUUID:(id)a3 bundleID:(id)a4 timestamp:(id)a5 triggerNotificationUUID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  ATXNotificationDeliverySuggestion *v14;
  uint64_t v15;
  NSUUID *uuid;
  uint64_t v17;
  NSString *entityIdentifier;
  uint64_t v19;
  NSDate *timestamp;
  uint64_t v21;
  NSUUID *triggerNotificationUUID;
  uint64_t v23;
  id subObject;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)ATXNotificationDeliverySuggestion;
  v14 = -[ATXNotificationDeliverySuggestion init](&v26, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    uuid = v14->_uuid;
    v14->_uuid = (NSUUID *)v15;

    v14->_scope = 1;
    v17 = objc_msgSend(v11, "copy");
    entityIdentifier = v14->_entityIdentifier;
    v14->_entityIdentifier = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    timestamp = v14->_timestamp;
    v14->_timestamp = (NSDate *)v19;

    v21 = objc_msgSend(v13, "copy");
    triggerNotificationUUID = v14->_triggerNotificationUUID;
    v14->_triggerNotificationUUID = (NSUUID *)v21;

    v14->_subtype = 9;
    v23 = objc_opt_new();
    subObject = v14->_subObject;
    v14->_subObject = (id)v23;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  ATXNotificationDeliverySuggestion *v4;
  ATXNotificationDeliverySuggestion *v5;
  BOOL v6;

  v4 = (ATXNotificationDeliverySuggestion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXNotificationDeliverySuggestion isEqualToATXNotificationDeliverySuggestion:](self, "isEqualToATXNotificationDeliverySuggestion:", v5);

  return v6;
}

- (BOOL)isEqualToATXNotificationDeliverySuggestion:(id)a3
{
  id *v4;
  NSUUID *uuid;
  NSUUID *v6;
  NSUUID *v7;
  NSUUID *v8;
  char v9;
  NSString *entityIdentifier;
  NSString *v11;
  NSString *v12;
  NSString *v13;
  char v14;
  NSDate *timestamp;
  NSDate *v16;
  NSDate *v17;
  NSDate *v18;
  char v19;
  NSUUID *triggerNotificationUUID;
  NSUUID *v21;
  NSUUID *v22;
  NSUUID *v23;
  char v24;
  id v25;
  void *v26;
  char v27;

  v4 = (id *)a3;
  uuid = self->_uuid;
  v6 = (NSUUID *)v4[1];
  if (uuid == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = uuid;
    v9 = -[NSUUID isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_21;
  }
  if ((id)self->_scope != v4[4])
    goto LABEL_21;
  entityIdentifier = self->_entityIdentifier;
  v11 = (NSString *)v4[5];
  if (entityIdentifier == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = entityIdentifier;
    v14 = -[NSString isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_21;
  }
  timestamp = self->_timestamp;
  v16 = (NSDate *)v4[2];
  if (timestamp == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = timestamp;
    v19 = -[NSDate isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_21;
  }
  triggerNotificationUUID = self->_triggerNotificationUUID;
  v21 = (NSUUID *)v4[3];
  if (triggerNotificationUUID == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = triggerNotificationUUID;
    v24 = -[NSUUID isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_21;
  }
  if ((id)self->_subtype != v4[6])
  {
LABEL_21:
    v27 = 0;
    goto LABEL_22;
  }
  v25 = self->_subObject;
  v26 = v25;
  if (v25 == v4[7])
    v27 = 1;
  else
    v27 = objc_msgSend(v25, "isEqual:");

LABEL_22:
  return v27;
}

- (unint64_t)hash
{
  uint64_t v3;
  int64_t v4;
  NSUInteger v5;
  uint64_t v6;
  uint64_t v7;
  int64_t subtype;
  unint64_t v9;

  v3 = -[NSUUID hash](self->_uuid, "hash");
  v4 = self->_scope - v3 + 32 * v3;
  v5 = -[NSString hash](self->_entityIdentifier, "hash") - v4 + 32 * v4;
  v6 = -[NSDate hash](self->_timestamp, "hash") - v5 + 32 * v5;
  v7 = -[NSUUID hash](self->_triggerNotificationUUID, "hash");
  subtype = self->_subtype;
  v9 = subtype - (v7 - v6 + 32 * v6) + 32 * (v7 - v6 + 32 * v6);
  if (subtype == 4)
  {
    v9 = objc_msgSend(self->_subObject, "hash") - v9 + 32 * v9;
    subtype = self->_subtype;
  }
  if (subtype == 5)
    return objc_msgSend(self->_subObject, "hash") - v9 + 32 * v9;
  return v9;
}

- (NSString)description
{
  id v3;
  id v4;
  NSUUID *uuid;
  void *v6;
  NSDate *timestamp;
  NSUUID *triggerNotificationUUID;
  NSString *entityIdentifier;
  void *v10;
  void *v11;

  if ((self->_subtype & 0xFFFFFFFFFFFFFFFELL) == 4)
    v3 = self->_subObject;
  else
    v3 = 0;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  uuid = self->_uuid;
  ATXNotificationSuggestionScopeToString(self->_scope);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  triggerNotificationUUID = self->_triggerNotificationUUID;
  entityIdentifier = self->_entityIdentifier;
  ATXSuggestionTypeToString(self->_subtype);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("UUID: %@ Scope: %@, Entity ID: %@, Timestamp: %@, Trigger UUID: %@, Sub type: %@, Sub object: %@"), uuid, v6, entityIdentifier, timestamp, triggerNotificationUUID, v10, v3);

  return (NSString *)v11;
}

- (id)encodeAsProto
{
  void *v2;
  void *v3;

  -[ATXNotificationDeliverySuggestion proto](self, "proto");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (ATXNotificationDeliverySuggestion)initWithProtoData:(id)a3
{
  id v4;
  ATXPBNotificationDeliverySuggestion *v5;
  ATXNotificationDeliverySuggestion *v6;

  if (a3)
  {
    v4 = a3;
    v5 = -[ATXPBNotificationDeliverySuggestion initWithData:]([ATXPBNotificationDeliverySuggestion alloc], "initWithData:", v4);

    self = -[ATXNotificationDeliverySuggestion initWithProto:](self, "initWithProto:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ATXNotificationDeliverySuggestion)initWithProto:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  ATXNotificationDeliverySuggestion *v14;
  ATXNotificationSmartPauseSuggestion *v16;
  void *v17;
  ATXNotificationSmartPauseSuggestion *v18;
  uint64_t v19;
  void *v20;
  ATXNotificationDeliverySuggestion *v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  ATXInterruptionManagerTuningSuggestion *v26;
  void *v27;
  uint64_t v28;
  id v29;
  NSObject *v30;

  v4 = a3;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      __atxlog_handle_notification_management();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        -[ATXNotificationDeliverySuggestion initWithProto:].cold.8();
      v14 = 0;
      goto LABEL_27;
    }
    v5 = v4;
    if ((-[NSObject hasUuid](v5, "hasUuid") & 1) != 0)
    {
      if ((-[NSObject hasScope](v5, "hasScope") & 1) != 0)
      {
        if ((-[NSObject hasEntityIdentifier](v5, "hasEntityIdentifier") & 1) != 0)
        {
          if ((-[NSObject hasTimestamp](v5, "hasTimestamp") & 1) != 0)
          {
            if ((-[NSObject hasOneofNotificationDeliverySuggestion](v5, "hasOneofNotificationDeliverySuggestion") & 1) != 0)
            {
              v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
              -[NSObject uuid](v5, "uuid");
              v7 = (void *)objc_claimAutoreleasedReturnValue();
              v8 = objc_msgSend(v6, "initWithUUIDString:", v7);

              if (!v8)
              {
                __atxlog_handle_notification_management();
                v10 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
                  -[ATXNotificationDeliverySuggestion initWithProto:].cold.1();
                v14 = 0;
                goto LABEL_44;
              }
              v9 = (void *)MEMORY[0x1E0C99D68];
              -[NSObject timestamp](v5, "timestamp");
              objc_msgSend(v9, "dateWithTimeIntervalSinceReferenceDate:");
              v10 = objc_claimAutoreleasedReturnValue();
              if (-[NSObject hasTriggerNotificationUUID](v5, "hasTriggerNotificationUUID"))
              {
                v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
                -[NSObject triggerNotificationUUID](v5, "triggerNotificationUUID");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);

              }
              else
              {
                v13 = 0;
              }
              if (-[NSObject hasSmartPause](v5, "hasSmartPause"))
              {
                v16 = [ATXNotificationSmartPauseSuggestion alloc];
                -[NSObject smartPause](v5, "smartPause");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v18 = -[ATXNotificationSmartPauseSuggestion initWithProto:](v16, "initWithProto:", v17);

                v19 = (int)-[NSObject scope](v5, "scope");
                -[NSObject entityIdentifier](v5, "entityIdentifier");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = -[ATXNotificationDeliverySuggestion initWithSmartPauseSuggestion:uuid:scope:entityIdentifier:timestamp:triggerNotificationUUID:](self, "initWithSmartPauseSuggestion:uuid:scope:entityIdentifier:timestamp:triggerNotificationUUID:", v18, v8, v19, v20, v10, v13);
                goto LABEL_35;
              }
              if (-[NSObject hasQuieting](v5, "hasQuieting"))
              {
                v22 = (int)-[NSObject scope](v5, "scope");
                -[NSObject entityIdentifier](v5, "entityIdentifier");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = -[ATXNotificationDeliverySuggestion initQuietingSuggestionWithUUID:scope:entityIdentifier:timestamp:triggerNotificationUUID:](self, "initQuietingSuggestionWithUUID:scope:entityIdentifier:timestamp:triggerNotificationUUID:", v8, v22, v23, v10, v13);
              }
              else
              {
                if (!-[NSObject hasPromoting](v5, "hasPromoting"))
                {
                  if (!-[NSObject hasInterruptionManagerTuning](v5, "hasInterruptionManagerTuning"))
                  {
                    if (-[NSObject hasSendToDigest](v5, "hasSendToDigest"))
                    {
                      -[NSObject entityIdentifier](v5, "entityIdentifier");
                      v18 = (ATXNotificationSmartPauseSuggestion *)objc_claimAutoreleasedReturnValue();
                      v29 = -[ATXNotificationDeliverySuggestion initSendToDigestSuggestionWithUUID:bundleID:timestamp:triggerNotificationUUID:](self, "initSendToDigestSuggestionWithUUID:bundleID:timestamp:triggerNotificationUUID:", v8, v18, v10, v13);
                    }
                    else if (-[NSObject hasUrgencyTuning](v5, "hasUrgencyTuning"))
                    {
                      -[NSObject entityIdentifier](v5, "entityIdentifier");
                      v18 = (ATXNotificationSmartPauseSuggestion *)objc_claimAutoreleasedReturnValue();
                      v29 = -[ATXNotificationDeliverySuggestion initUrgencyTuningSuggestionWithUUID:bundleID:timestamp:triggerNotificationUUID:](self, "initUrgencyTuningSuggestionWithUUID:bundleID:timestamp:triggerNotificationUUID:", v8, v18, v10, v13);
                    }
                    else if (-[NSObject hasSendMessagesToDigest](v5, "hasSendMessagesToDigest"))
                    {
                      -[NSObject entityIdentifier](v5, "entityIdentifier");
                      v18 = (ATXNotificationSmartPauseSuggestion *)objc_claimAutoreleasedReturnValue();
                      v29 = -[ATXNotificationDeliverySuggestion initSendToMessagesDigestSuggestionWithUUID:bundleID:timestamp:triggerNotificationUUID:](self, "initSendToMessagesDigestSuggestionWithUUID:bundleID:timestamp:triggerNotificationUUID:", v8, v18, v10, v13);
                    }
                    else
                    {
                      if (!-[NSObject hasTurnOffNotificationsForApp](v5, "hasTurnOffNotificationsForApp"))
                      {
                        __atxlog_handle_notifications();
                        v30 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
                          -[ATXNotificationDeliverySuggestion initWithProto:].cold.2();

                        v14 = 0;
                        goto LABEL_43;
                      }
                      -[NSObject entityIdentifier](v5, "entityIdentifier");
                      v18 = (ATXNotificationSmartPauseSuggestion *)objc_claimAutoreleasedReturnValue();
                      v29 = -[ATXNotificationDeliverySuggestion initTurnOffNotificationsForAppSuggestionWithUUID:bundleID:timestamp:triggerNotificationUUID:](self, "initTurnOffNotificationsForAppSuggestionWithUUID:bundleID:timestamp:triggerNotificationUUID:", v8, v18, v10, v13);
                    }
                    self = (ATXNotificationDeliverySuggestion *)v29;
                    goto LABEL_36;
                  }
                  v26 = [ATXInterruptionManagerTuningSuggestion alloc];
                  -[NSObject interruptionManagerTuning](v5, "interruptionManagerTuning");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v18 = -[ATXInterruptionManagerTuningSuggestion initWithProto:](v26, "initWithProto:", v27);

                  v28 = (int)-[NSObject scope](v5, "scope");
                  -[NSObject entityIdentifier](v5, "entityIdentifier");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = -[ATXNotificationDeliverySuggestion initWithInterruptionManagerTuningSuggestion:scope:entityIdentifier:uuid:timestamp:triggerNotificationUUID:](self, "initWithInterruptionManagerTuningSuggestion:scope:entityIdentifier:uuid:timestamp:triggerNotificationUUID:", v18, v28, v20, v8, v10, v13);
LABEL_35:
                  self = v21;

LABEL_36:
LABEL_42:
                  v14 = self;
LABEL_43:

LABEL_44:
                  goto LABEL_26;
                }
                v25 = (int)-[NSObject scope](v5, "scope");
                -[NSObject entityIdentifier](v5, "entityIdentifier");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = -[ATXNotificationDeliverySuggestion initPromotingSuggestionWithUUID:scope:entityIdentifier:timestamp:triggerNotificationUUID:](self, "initPromotingSuggestionWithUUID:scope:entityIdentifier:timestamp:triggerNotificationUUID:", v8, v25, v23, v10, v13);
              }
              self = (ATXNotificationDeliverySuggestion *)v24;

              goto LABEL_42;
            }
            __atxlog_handle_notification_management();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
              -[ATXNotificationDeliverySuggestion initWithProto:].cold.3();
          }
          else
          {
            __atxlog_handle_notification_management();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
              -[ATXNotificationDeliverySuggestion initWithProto:].cold.4();
          }
        }
        else
        {
          __atxlog_handle_notification_management();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
            -[ATXNotificationDeliverySuggestion initWithProto:].cold.5();
        }
      }
      else
      {
        __atxlog_handle_notification_management();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          -[ATXNotificationDeliverySuggestion initWithProto:].cold.6();
      }
    }
    else
    {
      __atxlog_handle_notification_management();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[ATXNotificationDeliverySuggestion initWithProto:].cold.7();
    }
    v14 = 0;
LABEL_26:

LABEL_27:
    goto LABEL_28;
  }
  v14 = 0;
LABEL_28:

  return v14;
}

- (id)proto
{
  id v3;
  void *v4;
  NSUUID *triggerNotificationUUID;
  void *v6;
  int64_t *p_subtype;
  NSObject *v8;
  void *v9;
  void *v10;
  id *p_subObject;
  id *v12;
  id *v13;
  id *v14;
  id *v15;
  id *v16;
  NSObject *v17;

  v3 = (id)objc_opt_new();
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUuid:", v4);

  objc_msgSend(v3, "setScope:", LODWORD(self->_scope));
  objc_msgSend(v3, "setEntityIdentifier:", self->_entityIdentifier);
  -[NSDate timeIntervalSinceReferenceDate](self->_timestamp, "timeIntervalSinceReferenceDate");
  objc_msgSend(v3, "setTimestamp:");
  triggerNotificationUUID = self->_triggerNotificationUUID;
  if (triggerNotificationUUID)
  {
    -[NSUUID UUIDString](triggerNotificationUUID, "UUIDString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTriggerNotificationUUID:", v6);

  }
  p_subtype = &self->_subtype;
  switch(self->_subtype)
  {
    case 0:
    case 3:
    case 0xALL:
      __atxlog_handle_notifications();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ATXNotificationDeliverySuggestion proto].cold.7((uint64_t)p_subtype);

      v9 = 0;
      goto LABEL_36;
    case 1:
      v10 = (void *)objc_opt_new();
      objc_msgSend(v3, "setQuieting:", v10);
      goto LABEL_21;
    case 2:
      v10 = (void *)objc_opt_new();
      objc_msgSend(v3, "setPromoting:", v10);
      goto LABEL_21;
    case 4:
      p_subObject = &self->_subObject;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*p_subObject, "proto");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setSmartPause:", v10);
        goto LABEL_21;
      }
      __atxlog_handle_notifications();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[ATXNotificationDeliverySuggestion proto].cold.1();
      goto LABEL_34;
    case 5:
      v12 = &self->_subObject;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*v12, "proto");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setInterruptionManagerTuning:", v10);
        goto LABEL_21;
      }
      __atxlog_handle_notifications();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[ATXNotificationDeliverySuggestion proto].cold.2();
      goto LABEL_34;
    case 6:
      v13 = &self->_subObject;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*v13, "proto");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setSendToDigest:", v10);
        goto LABEL_21;
      }
      __atxlog_handle_notifications();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        goto LABEL_27;
      goto LABEL_34;
    case 7:
      v14 = &self->_subObject;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*v14, "proto");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setUrgencyTuning:", v10);
        goto LABEL_21;
      }
      __atxlog_handle_notifications();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        -[ATXNotificationDeliverySuggestion proto].cold.5();
      goto LABEL_34;
    case 8:
      v15 = &self->_subObject;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*v15, "proto");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setSendMessagesToDigest:", v10);
        goto LABEL_21;
      }
      __atxlog_handle_notifications();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
LABEL_27:
        -[ATXNotificationDeliverySuggestion proto].cold.3();
      goto LABEL_34;
    case 9:
      v16 = &self->_subObject;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(*v16, "proto");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setTurnOffNotificationsForApp:", v10);
LABEL_21:

      }
      else
      {
        __atxlog_handle_notifications();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          -[ATXNotificationDeliverySuggestion proto].cold.6();
LABEL_34:

        v3 = 0;
      }
LABEL_35:
      v3 = v3;
      v9 = v3;
LABEL_36:

      return v9;
    default:
      goto LABEL_35;
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ATXNotificationDeliverySuggestion encodeAsProto](self, "encodeAsProto");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("protobufData"));

}

- (ATXNotificationDeliverySuggestion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  ATXNotificationDeliverySuggestion *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("protobufData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ATXNotificationDeliverySuggestion initWithProtoData:](self, "initWithProtoData:", v5);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXNotificationDeliverySuggestion *v4;
  id v5;
  int64_t *p_subtype;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;

  v4 = +[ATXNotificationDeliverySuggestion allocWithZone:](ATXNotificationDeliverySuggestion, "allocWithZone:", a3);
  v5 = v4;
  p_subtype = &self->_subtype;
  switch(self->_subtype)
  {
    case 0:
    case 3:
    case 0xALL:
      __atxlog_handle_notifications();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ATXNotificationDeliverySuggestion proto].cold.7((uint64_t)p_subtype);

      v8 = 0;
      goto LABEL_34;
    case 1:
      v9 = -[ATXNotificationDeliverySuggestion initQuietingSuggestionWithUUID:scope:entityIdentifier:timestamp:triggerNotificationUUID:](v4, "initQuietingSuggestionWithUUID:scope:entityIdentifier:timestamp:triggerNotificationUUID:", self->_uuid, self->_scope, self->_entityIdentifier, self->_timestamp, self->_triggerNotificationUUID);
      goto LABEL_19;
    case 2:
      v9 = -[ATXNotificationDeliverySuggestion initPromotingSuggestionWithUUID:scope:entityIdentifier:timestamp:triggerNotificationUUID:](v4, "initPromotingSuggestionWithUUID:scope:entityIdentifier:timestamp:triggerNotificationUUID:", self->_uuid, self->_scope, self->_entityIdentifier, self->_timestamp, self->_triggerNotificationUUID);
      goto LABEL_19;
    case 4:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend(v5, "initWithSmartPauseSuggestion:uuid:scope:entityIdentifier:timestamp:triggerNotificationUUID:", self->_subObject, self->_uuid, self->_scope, self->_entityIdentifier, self->_timestamp, self->_triggerNotificationUUID);
        goto LABEL_19;
      }
      __atxlog_handle_notifications();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[ATXNotificationDeliverySuggestion proto].cold.1();
      goto LABEL_32;
    case 5:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend(v5, "initWithInterruptionManagerTuningSuggestion:scope:entityIdentifier:uuid:timestamp:triggerNotificationUUID:", self->_subObject, self->_scope, self->_entityIdentifier, self->_uuid, self->_timestamp, self->_triggerNotificationUUID);
        goto LABEL_19;
      }
      __atxlog_handle_notifications();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[ATXNotificationDeliverySuggestion proto].cold.2();
      goto LABEL_32;
    case 6:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend(v5, "initSendToDigestSuggestionWithUUID:bundleID:timestamp:triggerNotificationUUID:", self->_uuid, self->_entityIdentifier, self->_timestamp, self->_triggerNotificationUUID);
        goto LABEL_19;
      }
      __atxlog_handle_notifications();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[ATXNotificationDeliverySuggestion proto].cold.3();
      goto LABEL_32;
    case 7:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend(v5, "initUrgencyTuningSuggestionWithUUID:bundleID:timestamp:triggerNotificationUUID:", self->_uuid, self->_entityIdentifier, self->_timestamp, self->_triggerNotificationUUID);
        goto LABEL_19;
      }
      __atxlog_handle_notifications();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[ATXNotificationDeliverySuggestion proto].cold.5();
      goto LABEL_32;
    case 8:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend(v5, "initSendToMessagesDigestSuggestionWithUUID:bundleID:timestamp:triggerNotificationUUID:", self->_uuid, self->_entityIdentifier, self->_timestamp, self->_triggerNotificationUUID);
        goto LABEL_19;
      }
      __atxlog_handle_notifications();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        -[ATXNotificationDeliverySuggestion copyWithZone:].cold.5();
      goto LABEL_32;
    case 9:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = objc_msgSend(v5, "initTurnOffNotificationsForAppSuggestionWithUUID:bundleID:timestamp:triggerNotificationUUID:", self->_uuid, self->_entityIdentifier, self->_timestamp, self->_triggerNotificationUUID);
LABEL_19:
        v5 = (id)v9;
      }
      else
      {
        __atxlog_handle_notifications();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          -[ATXNotificationDeliverySuggestion copyWithZone:].cold.6();
LABEL_32:

        v5 = 0;
      }
LABEL_33:
      v5 = v5;
      v8 = v5;
LABEL_34:

      return v8;
    default:
      goto LABEL_33;
  }
}

- (unsigned)dataVersion
{
  return 0;
}

+ (id)eventWithData:(id)a3 dataVersion:(unsigned int)a4
{
  id v5;
  void *v6;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithProtoData:", v5);

  return v6;
}

- (id)jsonRawData
{
  void *v3;
  void *v4;
  NSDate *timestamp;
  NSUUID *triggerNotificationUUID;
  void *v7;
  id subObject;
  void *v9;
  _QWORD v11[6];
  _QWORD v12[7];

  v12[6] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("uuid");
  -[NSUUID UUIDString](self->_uuid, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("scope");
  ATXNotificationSuggestionScopeToString(self->_scope);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  timestamp = self->_timestamp;
  triggerNotificationUUID = self->_triggerNotificationUUID;
  v12[1] = v4;
  v12[2] = timestamp;
  v11[2] = CFSTR("timestamp");
  v11[3] = CFSTR("triggerNotificationUUID");
  v12[3] = triggerNotificationUUID;
  v11[4] = CFSTR("subType");
  ATXSuggestionTypeToString(self->_subtype);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[5] = CFSTR("subObject");
  subObject = self->_subObject;
  v12[4] = v7;
  v12[5] = subObject;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)json
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB36D8];
  -[ATXNotificationDeliverySuggestion jsonRawData](self, "jsonRawData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithJSONObject:options:error:", v3, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (NSUUID)triggerNotificationUUID
{
  return self->_triggerNotificationUUID;
}

- (void)setTriggerNotificationUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)scope
{
  return self->_scope;
}

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (int64_t)subtype
{
  return self->_subtype;
}

- (id)subObject
{
  return self->_subObject;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_subObject, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_triggerNotificationUUID, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)initWithProto:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "%@: decoded uuid was nil.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)initWithProto:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "%@: Invalid field suggestion.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)initWithProto:.cold.3()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "%@: missing field suggestion.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)initWithProto:.cold.4()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "%@: missing field timestamp.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)initWithProto:.cold.5()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "%@: missing field entityIdentifier.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)initWithProto:.cold.6()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "%@: missing field scope.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)initWithProto:.cold.7()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "%@: missing field uuid.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)initWithProto:.cold.8()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_2_1();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_3(&dword_1A49EF000, v2, v3, "%@: Unable to construct class from ProtoBuf object", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)proto
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v1 = OUTLINED_FUNCTION_6_5(a1);
  ATXSuggestionTypeToString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_6(&dword_1A49EF000, v3, v4, "Ignored unsupported subtype: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_3();
}

- (void)copyWithZone:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_9();
  v2 = OUTLINED_FUNCTION_6_5(v1);
  ATXSuggestionTypeToString(v2);
  objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)OUTLINED_FUNCTION_4_4();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_13(&dword_1A49EF000, v5, v6, "Unexpected subObject: %@ for subtype: %@, expecting ATXSendMessagesToDigestSuggestion.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_5_0();
}

- (void)copyWithZone:.cold.6()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_9();
  v2 = OUTLINED_FUNCTION_6_5(v1);
  ATXSuggestionTypeToString(v2);
  objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)OUTLINED_FUNCTION_4_4();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_13(&dword_1A49EF000, v5, v6, "Unexpected subObject: %@ for subtype: %@, expecting ATXSuggestionTypeTurnOffNotificationsForApp.", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_5_0();
}

@end
