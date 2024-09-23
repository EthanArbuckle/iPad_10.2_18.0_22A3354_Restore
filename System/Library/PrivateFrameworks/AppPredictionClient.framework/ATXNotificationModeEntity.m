@implementation ATXNotificationModeEntity

- (ATXNotificationModeEntity)initWithAppEntity:(id)a3
{
  return -[ATXNotificationModeEntity initWithAppEntity:contactEntity:](self, "initWithAppEntity:contactEntity:", a3, 0);
}

- (ATXNotificationModeEntity)initWithContactEntity:(id)a3
{
  return -[ATXNotificationModeEntity initWithAppEntity:contactEntity:](self, "initWithAppEntity:contactEntity:", 0, a3);
}

- (ATXNotificationModeEntity)initWithAppEntity:(id)a3 contactEntity:(id)a4
{
  id v7;
  id v8;
  ATXNotificationModeEntity *v9;
  ATXNotificationModeEntity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXNotificationModeEntity;
  v9 = -[ATXNotificationModeEntity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_appEntity, a3);
    objc_storeStrong((id *)&v10->_contactEntity, a4);
  }

  return v10;
}

- (ATXNotificationModeEntity)initWithUserNotification:(id)a3
{
  id v4;
  ATXAppModeEntity *v5;
  void *v6;
  ATXAppModeEntity *v7;
  void *v8;
  ATXNotificationModeEntity *v9;

  v4 = a3;
  v5 = [ATXAppModeEntity alloc];
  objc_msgSend(v4, "bundleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXAppModeEntity initWithBundleId:](v5, "initWithBundleId:", v6);

  -[ATXNotificationModeEntity contactEntityFromUserNotification:](self, "contactEntityFromUserNotification:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[ATXNotificationModeEntity initWithAppEntity:contactEntity:](self, "initWithAppEntity:contactEntity:", v7, v8);
  return v9;
}

- (id)contactEntityFromUserNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ATXContactModeEntity *v8;

  v4 = a3;
  -[ATXNotificationModeEntity contactIdFromUserNotification:](self, "contactIdFromUserNotification:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = -[ATXContactModeEntity initWithDisplayName:rawIdentifier:cnContactId:stableContactIdentifier:]([ATXContactModeEntity alloc], "initWithDisplayName:rawIdentifier:cnContactId:stableContactIdentifier:", 0, v7, v5, 0);
  else
    v8 = 0;

  return v8;
}

- (id)contactIdFromUserNotification:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "isGroupMessage"))
  {
    objc_msgSend(v3, "threadID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "contactIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v5;
  }

  return v4;
}

- (ATXNotificationModeEntity)initWithUNNotification:(id)a3
{
  ATXAppModeEntity *v4;
  ATXContactModeEntity *v5;
  ATXNotificationModeEntity *v6;

  v4 = -[ATXAppModeEntity initWithBundleId:]([ATXAppModeEntity alloc], "initWithBundleId:", CFSTR("com.apple.Music"));
  v5 = -[ATXContactModeEntity initWithDisplayName:rawIdentifier:cnContactId:]([ATXContactModeEntity alloc], "initWithDisplayName:rawIdentifier:cnContactId:", 0, CFSTR("sample"), 0);
  v6 = -[ATXNotificationModeEntity initWithAppEntity:contactEntity:](self, "initWithAppEntity:contactEntity:", v4, v5);

  return v6;
}

- (id)identifier
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXAppModeEntity bundleId](self->_appEntity, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXContactModeEntity identifier](self->_contactEntity, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@:%@"), v4, v5);

  return v6;
}

- (id)jsonDict
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v10[0] = CFSTR("entityIdentifier");
  -[ATXNotificationModeEntity identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[1] = CFSTR("scoreMetadata");
  v11[0] = v4;
  -[ATXNotificationModeEntity scoreMetadata](self, "scoreMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "jsonDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)

  if (!v3)
  return v8;
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;

  -[ATXNotificationModeEntity jsonDict](self, "jsonDict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)description
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[ATXNotificationModeEntity identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationModeEntity scoreMetadata](self, "scoreMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "score");
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("entityIdentifier: %@, score: %.3f"), v4, v6);

  return (NSString *)v7;
}

- (BOOL)isEqual:(id)a3
{
  ATXNotificationModeEntity *v4;
  ATXNotificationModeEntity *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (ATXNotificationModeEntity *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[ATXNotificationModeEntity identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXNotificationModeEntity identifier](v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqualToString:", v7);
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[ATXNotificationModeEntity identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[ATXNotificationModeEntity appEntity](self, "appEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("codingKeyForAppEntity"));

  -[ATXNotificationModeEntity contactEntity](self, "contactEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("codingKeyForContactEntity"));

  -[ATXNotificationModeEntity scoreMetadata](self, "scoreMetadata");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("codingKeyForScoreMetadata"));

}

- (ATXNotificationModeEntity)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  ATXNotificationModeEntity *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D81610];
  v6 = objc_opt_class();
  __atxlog_handle_notification_management();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v6, CFSTR("codingKeyForAppEntity"), v4, 0, CFSTR("com.apple.proactive.decode.notificationModeEntity"), -1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0D81610];
    v12 = objc_opt_class();
    __atxlog_handle_notification_management();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v12, CFSTR("codingKeyForContactEntity"), v4, 0, CFSTR("com.apple.proactive.decode.notificationModeEntity"), -1, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v10 = 0;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0D81610];
      v17 = objc_opt_class();
      __atxlog_handle_notification_management();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("codingKeyForScoreMetadata"), v4, 0, CFSTR("com.apple.proactive.decode.notificationModeEntity"), -1, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "error");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        v10 = 0;
      }
      else
      {
        self = -[ATXNotificationModeEntity initWithAppEntity:contactEntity:](self, "initWithAppEntity:contactEntity:", v8, v14);
        -[ATXNotificationModeEntity setScoreMetadata:](self, "setScoreMetadata:", v19);
        v10 = self;
      }

    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ATXNotificationModeEntity *v4;
  void *v5;
  void *v6;
  ATXNotificationModeEntity *v7;

  v4 = +[ATXNotificationModeEntity allocWithZone:](ATXNotificationModeEntity, "allocWithZone:", a3);
  -[ATXNotificationModeEntity appEntity](self, "appEntity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationModeEntity contactEntity](self, "contactEntity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXNotificationModeEntity initWithAppEntity:contactEntity:](v4, "initWithAppEntity:contactEntity:", v5, v6);

  return v7;
}

- (ATXModeEntityScore)scoreMetadata
{
  return self->scoreMetadata;
}

- (void)setScoreMetadata:(id)a3
{
  objc_storeStrong((id *)&self->scoreMetadata, a3);
}

- (ATXAppModeEntity)appEntity
{
  return self->_appEntity;
}

- (void)setAppEntity:(id)a3
{
  objc_storeStrong((id *)&self->_appEntity, a3);
}

- (ATXContactModeEntity)contactEntity
{
  return self->_contactEntity;
}

- (void)setContactEntity:(id)a3
{
  objc_storeStrong((id *)&self->_contactEntity, a3);
}

- (double)receiveTimestamp
{
  return self->_receiveTimestamp;
}

- (void)setReceiveTimestamp:(double)a3
{
  self->_receiveTimestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactEntity, 0);
  objc_storeStrong((id *)&self->_appEntity, 0);
  objc_storeStrong((id *)&self->scoreMetadata, 0);
}

@end
