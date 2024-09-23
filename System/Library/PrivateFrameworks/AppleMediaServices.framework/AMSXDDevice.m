@implementation AMSXDDevice

- (AMSXDDevice)initWithDeviceID:(id)a3 type:(int64_t)a4
{
  id v7;
  AMSXDDevice *v8;
  AMSXDDevice *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSXDDevice;
  v8 = -[AMSXDDevice init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_type = a4;
  }

  return v9;
}

+ (id)activePairedDevices
{
  return -[AMSXDDevice initWithDeviceID:type:]([AMSXDDevice alloc], "initWithDeviceID:type:", 0, 1);
}

+ (id)allPairedDevices
{
  return -[AMSXDDevice initWithDeviceID:type:]([AMSXDDevice alloc], "initWithDeviceID:type:", 0, 2);
}

+ (id)deviceFromIdentifier:(id)a3
{
  id v3;
  AMSXDDevice *v4;

  v3 = a3;
  v4 = -[AMSXDDevice initWithDeviceID:type:]([AMSXDDevice alloc], "initWithDeviceID:type:", v3, 3);

  return v4;
}

- (AMSXDDevice)initWithJSONDictionary:(id)a3
{
  id v4;
  AMSXDDevice *v5;
  void *v6;
  NSString *v7;
  AMSXDDevice *v8;
  NSString *identifier;
  void *v10;
  id v11;
  objc_super v13;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v13.receiver = self;
    v13.super_class = (Class)AMSXDDevice;
    v5 = -[AMSXDDevice init](&v13, sel_init);
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kJSONKeyIdentifier"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v7 = v6;
      else
        v7 = 0;

      identifier = v5->_identifier;
      v5->_identifier = v7;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kJSONKeyType"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v11 = v10;
      else
        v11 = 0;

      v5->_type = objc_msgSend(v11, "integerValue");
    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (NSDictionary)JSONDictionary
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[AMSXDDevice identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("kJSONKeyIdentifier"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[AMSXDDevice type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("kJSONKeyType"));

  return (NSDictionary *)v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[AMSXDDevice JSONDictionary](self, "JSONDictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v10))
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v10, 0, &v16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v16;
    objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("kCodingKeyData"));

    if (!v12)
      goto LABEL_11;
  }
  else
  {
    AMSErrorWithFormat(3, CFSTR("AMSXDDevice Error"), CFSTR("Invalid JSON for device"), v5, v6, v7, v8, v9, (uint64_t)self);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_11;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v13, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v18 = v15;
    v19 = 2114;
    v20 = v12;
    _os_log_impl(&dword_18C849000, v14, OS_LOG_TYPE_ERROR, "%{public}@: Failed to encode message. Error: %{public}@", buf, 0x16u);
  }

LABEL_11:
}

- (AMSXDDevice)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  AMSXDDevice *v8;
  NSObject *v9;
  uint64_t v10;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kCodingKeyData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v6)
    {
      self = -[AMSXDDevice initWithJSONDictionary:](self, "initWithJSONDictionary:", v6);
      v8 = self;
      goto LABEL_10;
    }
  }
  else
  {
    v7 = 0;
  }
  +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    +[AMSLogConfig sharedConfig](AMSLogConfig, "sharedConfig");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "OSLogObject");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v14 = v10;
    v15 = 2114;
    v16 = v7;
    _os_log_impl(&dword_18C849000, v9, OS_LOG_TYPE_ERROR, "%{public}@: Failed to decode JSON. Error: %{public}@", buf, 0x16u);
  }

  v8 = 0;
LABEL_10:

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
