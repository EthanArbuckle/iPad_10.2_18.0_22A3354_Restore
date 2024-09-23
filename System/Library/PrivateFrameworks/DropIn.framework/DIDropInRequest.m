@implementation DIDropInRequest

- (DIDropInRequest)initWithDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  DIHandle *v9;
  void *v10;
  DIDropInRequest *v11;
  int v13;
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  DILogHandleDropInRequest();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = &stru_250B97E20;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_23A742000, v5, OS_LOG_TYPE_DEFAULT, "%@Creating Request with device %@", (uint8_t *)&v13, 0x16u);
  }

  objc_msgSend(v4, "homeKitIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v4, "homeKitIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = &stru_250B97E20;
  }

  v9 = -[DIHandle initWithType:value:]([DIHandle alloc], "initWithType:value:", 0, v8);
  objc_msgSend(v4, "connectionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[DIDropInRequest initWithHandle:connectionManager:](self, "initWithHandle:connectionManager:", v9, v10);

  return v11;
}

- (DIDropInRequest)initWithHandle:(id)a3 connectionManager:(id)a4
{
  id v7;
  id v8;
  DIDropInRequest *v9;
  DIDropInRequest *v10;
  NSObject *v11;
  objc_super v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  DIDropInRequest *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DIDropInRequest;
  v9 = -[DIDropInRequest init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_handle, a3);
    objc_storeWeak((id *)&v10->_connectionManager, v8);
  }
  DILogHandleDropInRequest();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = &stru_250B97E20;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_23A742000, v11, OS_LOG_TYPE_DEFAULT, "%@Created Request %@", buf, 0x16u);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  DIDropInRequest *v4;
  DIDropInRequest *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (DIDropInRequest *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[DIDropInRequest handle](self, "handle");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[DIDropInRequest handle](v5, "handle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v6, "isEqual:", v7);
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

  -[DIDropInRequest handle](self, "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[DIDropInRequest handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Handle = [%@]"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DIDropInRequest handle](self, "handle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Handle"));

  -[DIDropInRequest existingSessionIdentifier](self, "existingSessionIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ExistingSessionIdentifier"));

}

- (DIDropInRequest)initWithCoder:(id)a3
{
  id v4;
  DIDropInRequest *v5;
  DIDropInRequest *v6;
  void *v7;

  v4 = a3;
  v5 = -[DIDropInRequest init](self, "init");
  if (!v5)
    goto LABEL_4;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Handle"));
  v6 = (DIDropInRequest *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[DIDropInRequest setHandle:](v5, "setHandle:", v6);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ExistingSessionIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[DIDropInRequest setExistingSessionIdentifier:](v5, "setExistingSessionIdentifier:", v7);

LABEL_4:
    v6 = v5;
  }

  return v6;
}

- (DIHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (DIXPCConnectionManager)connectionManager
{
  return (DIXPCConnectionManager *)objc_loadWeakRetained((id *)&self->_connectionManager);
}

- (void)setConnectionManager:(id)a3
{
  objc_storeWeak((id *)&self->_connectionManager, a3);
}

- (NSUUID)existingSessionIdentifier
{
  return self->_existingSessionIdentifier;
}

- (void)setExistingSessionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_existingSessionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingSessionIdentifier, 0);
  objc_destroyWeak((id *)&self->_connectionManager);
  objc_storeStrong((id *)&self->_handle, 0);
}

@end
