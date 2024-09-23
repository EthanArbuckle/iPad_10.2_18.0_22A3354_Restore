@implementation AFSiriActivationContext

- (AFSiriActivationContext)initWithBuilder:(id)a3
{
  void (**v4)(id, _AFSiriActivationContextMutation *);
  AFSiriActivationContext *v5;
  AFSiriActivationContext *v6;
  _AFSiriActivationContextMutation *v7;
  void *v8;
  uint64_t v9;
  NSString *deviceID;
  void *v11;
  uint64_t v12;
  NSDictionary *userInfo;
  objc_super v15;

  v4 = (void (**)(id, _AFSiriActivationContextMutation *))a3;
  v15.receiver = self;
  v15.super_class = (Class)AFSiriActivationContext;
  v5 = -[AFSiriActivationContext init](&v15, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = -[_AFSiriActivationContextMutation initWithBase:]([_AFSiriActivationContextMutation alloc], "initWithBase:", 0);
    v4[2](v4, v7);
    if (-[_AFSiriActivationContextMutation isDirty](v7, "isDirty"))
    {
      v6->_timestamp = -[_AFSiriActivationContextMutation getTimestamp](v7, "getTimestamp");
      v6->_source = -[_AFSiriActivationContextMutation getSource](v7, "getSource");
      v6->_event = -[_AFSiriActivationContextMutation getEvent](v7, "getEvent");
      v6->_options = -[_AFSiriActivationContextMutation getOptions](v7, "getOptions");
      -[_AFSiriActivationContextMutation getDeviceID](v7, "getDeviceID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "copy");
      deviceID = v6->_deviceID;
      v6->_deviceID = (NSString *)v9;

      -[_AFSiriActivationContextMutation getUserInfo](v7, "getUserInfo");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "copy");
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v12;

    }
  }

  return v6;
}

- (AFSiriActivationContext)init
{
  return -[AFSiriActivationContext initWithBuilder:](self, "initWithBuilder:", 0);
}

- (AFSiriActivationContext)initWithTimestamp:(unint64_t)a3 source:(int64_t)a4 event:(int64_t)a5 options:(unint64_t)a6 deviceID:(id)a7 userInfo:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  AFSiriActivationContext *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  unint64_t v23;
  int64_t v24;
  int64_t v25;
  unint64_t v26;

  v14 = a7;
  v15 = a8;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __84__AFSiriActivationContext_initWithTimestamp_source_event_options_deviceID_userInfo___block_invoke;
  v20[3] = &unk_1E3A32B50;
  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v21 = v14;
  v22 = v15;
  v16 = v15;
  v17 = v14;
  v18 = -[AFSiriActivationContext initWithBuilder:](self, "initWithBuilder:", v20);

  return v18;
}

- (NSString)description
{
  return (NSString *)-[AFSiriActivationContext _descriptionWithIndent:](self, "_descriptionWithIndent:", 0);
}

- (id)_descriptionWithIndent:(unint64_t)a3
{
  id v4;
  void *v5;
  unint64_t source;
  __CFString *v7;
  unint64_t timestamp;
  __CFString *v9;
  unint64_t event;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v17;

  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v17.receiver = self;
  v17.super_class = (Class)AFSiriActivationContext;
  -[AFSiriActivationContext description](&v17, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  source = self->_source;
  if (source > 0xF)
    v7 = CFSTR("(unknown)");
  else
    v7 = off_1E3A2D180[source];
  timestamp = self->_timestamp;
  v9 = v7;
  event = self->_event;
  if (event > 0x17)
    v11 = CFSTR("(unknown)");
  else
    v11 = off_1E3A359D8[event];
  v12 = v11;
  AFSiriActivationOptionsGetNames(self->_options);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "componentsJoinedByString:", CFSTR("|"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@ {timestamp = %llu, source = %@, event = %@, options = %@, deviceID = %@, userInfo = %@}"), v5, timestamp, v9, v12, v14, self->_deviceID, self->_userInfo);

  return v15;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  unint64_t v12;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_source);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_event);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_options);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  v11 = -[NSString hash](self->_deviceID, "hash");
  v12 = v10 ^ v11 ^ -[NSDictionary hash](self->_userInfo, "hash");

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  AFSiriActivationContext *v4;
  AFSiriActivationContext *v5;
  unint64_t timestamp;
  int64_t source;
  int64_t event;
  unint64_t options;
  NSString *v10;
  NSString *deviceID;
  NSDictionary *v12;
  NSDictionary *userInfo;
  BOOL v14;

  v4 = (AFSiriActivationContext *)a3;
  if (self == v4)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      timestamp = self->_timestamp;
      if (timestamp == -[AFSiriActivationContext timestamp](v5, "timestamp")
        && (source = self->_source, source == -[AFSiriActivationContext source](v5, "source"))
        && (event = self->_event, event == -[AFSiriActivationContext event](v5, "event"))
        && (options = self->_options, options == -[AFSiriActivationContext options](v5, "options")))
      {
        -[AFSiriActivationContext deviceID](v5, "deviceID");
        v10 = (NSString *)objc_claimAutoreleasedReturnValue();
        deviceID = self->_deviceID;
        if (deviceID == v10 || -[NSString isEqual:](deviceID, "isEqual:", v10))
        {
          -[AFSiriActivationContext userInfo](v5, "userInfo");
          v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
          userInfo = self->_userInfo;
          v14 = userInfo == v12 || -[NSDictionary isEqual:](userInfo, "isEqual:", v12);

        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

- (AFSiriActivationContext)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  AFSiriActivationContext *v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSiriActivationContext::timestamp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v4, "unsignedLongLongValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSiriActivationContext::source"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v5, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSiriActivationContext::event"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSiriActivationContext::options"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AFSiriActivationContext::deviceID"));
  v8 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0C99E60];
  v26 = (void *)v8;
  v24 = objc_opt_class();
  v23 = objc_opt_class();
  v22 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v14 = objc_opt_class();
  v15 = objc_opt_class();
  v16 = objc_opt_class();
  v17 = objc_opt_class();
  objc_msgSend(v25, "setWithObjects:", v24, v23, v22, v9, v10, v11, v12, v13, v14, v15, v16, v17, objc_opt_class(), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClasses:forKey:", v18, CFSTR("AFSiriActivationContext::userInfo"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[AFSiriActivationContext initWithTimestamp:source:event:options:deviceID:userInfo:](self, "initWithTimestamp:source:event:options:deviceID:userInfo:", v30, v29, v28, v27, v26, v19);
  return v20;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  unint64_t timestamp;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  timestamp = self->_timestamp;
  v10 = a3;
  objc_msgSend(v4, "numberWithUnsignedLongLong:", timestamp);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v6, CFSTR("AFSiriActivationContext::timestamp"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_source);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("AFSiriActivationContext::source"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_event);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("AFSiriActivationContext::event"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_options);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("AFSiriActivationContext::options"));

  objc_msgSend(v10, "encodeObject:forKey:", self->_deviceID, CFSTR("AFSiriActivationContext::deviceID"));
  objc_msgSend(v10, "encodeObject:forKey:", self->_userInfo, CFSTR("AFSiriActivationContext::userInfo"));

}

- (AFSiriActivationContext)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  AFSiriActivationContext *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v19;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("timestamp"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    v9 = objc_msgSend(v7, "unsignedLongLongValue");
    objc_msgSend(v5, "objectForKey:", CFSTR("source"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = AFSiriActivationSourceGetFromName(v10);
    else
      v11 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("event"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = AFSiriActivationEventGetFromName(v12);
    else
      v13 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("options"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = AFSiriActivationOptionsGetFromNames(v14);
    else
      v15 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("deviceID"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v17 = v16;
    else
      v17 = 0;

    objc_msgSend(v5, "objectForKey:", CFSTR("userInfo"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = v18;
    else
      v19 = 0;

    self = -[AFSiriActivationContext initWithTimestamp:source:event:options:deviceID:userInfo:](self, "initWithTimestamp:source:event:options:deviceID:userInfo:", v9, v11, v13, v15, v17, v19);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)buildDictionaryRepresentation
{
  id v3;
  void *v4;
  unint64_t source;
  __CFString *v6;
  __CFString *v7;
  unint64_t event;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  NSString *deviceID;
  NSDictionary *userInfo;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_timestamp);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("timestamp"));

  source = self->_source;
  if (source > 0xF)
    v6 = CFSTR("(unknown)");
  else
    v6 = off_1E3A2D180[source];
  v7 = v6;
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("source"));

  event = self->_event;
  if (event > 0x17)
    v9 = CFSTR("(unknown)");
  else
    v9 = off_1E3A359D8[event];
  v10 = v9;
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("event"));

  AFSiriActivationOptionsGetNames(self->_options);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("options"));

  deviceID = self->_deviceID;
  if (deviceID)
    objc_msgSend(v3, "setObject:forKey:", deviceID, CFSTR("deviceID"));
  userInfo = self->_userInfo;
  if (userInfo)
    objc_msgSend(v3, "setObject:forKey:", userInfo, CFSTR("userInfo"));
  v14 = (void *)objc_msgSend(v3, "copy");

  return v14;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)source
{
  return self->_source;
}

- (int64_t)event
{
  return self->_event;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)deviceID
{
  return self->_deviceID;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_deviceID, 0);
}

void __84__AFSiriActivationContext_initWithTimestamp_source_event_options_deviceID_userInfo___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = a1[6];
  v4 = a2;
  objc_msgSend(v4, "setTimestamp:", v3);
  objc_msgSend(v4, "setSource:", a1[7]);
  objc_msgSend(v4, "setEvent:", a1[8]);
  objc_msgSend(v4, "setOptions:", a1[9]);
  objc_msgSend(v4, "setDeviceID:", a1[4]);
  objc_msgSend(v4, "setUserInfo:", a1[5]);

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
  void (**v4)(id, _AFSiriActivationContextMutation *);
  _AFSiriActivationContextMutation *v5;
  AFSiriActivationContext *v6;
  void *v7;
  uint64_t v8;
  NSString *deviceID;
  void *v10;
  uint64_t v11;
  NSDictionary *userInfo;

  v4 = (void (**)(id, _AFSiriActivationContextMutation *))a3;
  if (v4)
  {
    v5 = -[_AFSiriActivationContextMutation initWithBase:]([_AFSiriActivationContextMutation alloc], "initWithBase:", self);
    v4[2](v4, v5);
    if (-[_AFSiriActivationContextMutation isDirty](v5, "isDirty"))
    {
      v6 = objc_alloc_init(AFSiriActivationContext);
      v6->_timestamp = -[_AFSiriActivationContextMutation getTimestamp](v5, "getTimestamp");
      v6->_source = -[_AFSiriActivationContextMutation getSource](v5, "getSource");
      v6->_event = -[_AFSiriActivationContextMutation getEvent](v5, "getEvent");
      v6->_options = -[_AFSiriActivationContextMutation getOptions](v5, "getOptions");
      -[_AFSiriActivationContextMutation getDeviceID](v5, "getDeviceID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      deviceID = v6->_deviceID;
      v6->_deviceID = (NSString *)v8;

      -[_AFSiriActivationContextMutation getUserInfo](v5, "getUserInfo");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      userInfo = v6->_userInfo;
      v6->_userInfo = (NSDictionary *)v11;

    }
    else
    {
      v6 = (AFSiriActivationContext *)-[AFSiriActivationContext copy](self, "copy");
    }

  }
  else
  {
    v6 = (AFSiriActivationContext *)-[AFSiriActivationContext copy](self, "copy");
  }

  return v6;
}

@end
