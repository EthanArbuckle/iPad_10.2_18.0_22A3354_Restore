@implementation ASDTestFlightServiceExtensionPushMessage

- (ASDTestFlightServiceExtensionPushMessage)initWithTimestamp:(id)a3 userInfo:(id)a4
{
  id v7;
  id v8;
  ASDTestFlightServiceExtensionPushMessage *v9;
  ASDTestFlightServiceExtensionPushMessage *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASDTestFlightServiceExtensionPushMessage;
  v9 = -[ASDTestFlightServiceExtensionPushMessage init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_timestamp, a3);
    objc_storeStrong((id *)&v10->_userInfo, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDTestFlightServiceExtensionPushMessage *v5;
  uint64_t v6;
  NSDate *timestamp;
  uint64_t v8;
  NSDictionary *userInfo;

  v5 = -[ASDTestFlightServiceExtensionPushMessage init](+[ASDTestFlightServiceExtensionPushMessage allocWithZone:](ASDTestFlightServiceExtensionPushMessage, "allocWithZone:"), "init");
  v6 = -[NSDate copyWithZone:](self->_timestamp, "copyWithZone:", a3);
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSDate *)v6;

  v8 = -[NSDictionary copyWithZone:](self->_userInfo, "copyWithZone:", a3);
  userInfo = v5->_userInfo;
  v5->_userInfo = (NSDictionary *)v8;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDTestFlightServiceExtensionPushMessage)initWithCoder:(id)a3
{
  id v4;
  ASDTestFlightServiceExtensionPushMessage *v5;
  uint64_t v6;
  NSDate *timestamp;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *userInfo;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ASDTestFlightServiceExtensionPushMessage init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v6 = objc_claimAutoreleasedReturnValue();
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v6;

    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8, v13, v14, v15, v16, v17, v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("userInfo"));
    v10 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *timestamp;
  id v5;

  timestamp = self->_timestamp;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInfo, CFSTR("userInfo"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)-[NSDictionary mutableCopy](self->_userInfo, "mutableCopy");
  if (!objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v3)
    || (objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, 0),
        (v4 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v5 = (void *)v4,
        v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v4, 4),
        v5,
        !v6))
  {
    objc_msgSend(v3, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), self->_timestamp, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
