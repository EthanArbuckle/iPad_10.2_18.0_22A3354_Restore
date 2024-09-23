@implementation PrivacyProxyNetworkStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkName, 0);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyNetworkStatus networkStatus](self, "networkStatus"), CFSTR("PrivacyProxyNetworkStatus"));
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyNetworkStatus networkType](self, "networkType"), CFSTR("PrivacyProxyNetworkType"));
  -[PrivacyProxyNetworkStatus networkName](self, "networkName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PrivacyProxyNetworkName"));

}

- (int)networkType
{
  return self->_networkType;
}

- (unint64_t)networkStatus
{
  return self->_networkStatus;
}

- (NSString)networkName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (PrivacyProxyNetworkStatus)initWithCoder:(id)a3
{
  id v4;
  PrivacyProxyNetworkStatus *v5;
  uint64_t v6;
  NSString *networkName;
  PrivacyProxyNetworkStatus *v8;
  NSObject *v10;
  uint8_t v11[16];
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PrivacyProxyNetworkStatus;
  v5 = -[PrivacyProxyNetworkStatus init](&v12, sel_init);
  if (v5)
  {
    v5->_networkStatus = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyNetworkStatus"));
    v5->_networkType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyNetworkType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivacyProxyNetworkName"));
    v6 = objc_claimAutoreleasedReturnValue();
    networkName = v5->_networkName;
    v5->_networkName = (NSString *)v6;

    v8 = v5;
  }
  else
  {
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_fault_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_FAULT, "[super init] failed", v11, 2u);
    }

  }
  return v5;
}

- (id)networkStatusString
{
  unint64_t v2;

  v2 = -[PrivacyProxyNetworkStatus networkStatus](self, "networkStatus");
  if (v2 > 2)
    return CFSTR("Invalid");
  else
    return off_1E41374E8[v2];
}

- (id)networkTypeString
{
  unsigned int v2;

  v2 = -[PrivacyProxyNetworkStatus networkType](self, "networkType");
  if (v2 > 4)
    return CFSTR("Invalid");
  else
    return off_1E4137500[v2];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  -[PrivacyProxyNetworkStatus networkStatusString](self, "networkStatusString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v8, CFSTR("Network Status"), a3, a4);

  -[PrivacyProxyNetworkStatus networkTypeString](self, "networkTypeString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v9, CFSTR("Network Type"), a3, a4);

  -[PrivacyProxyNetworkStatus networkName](self, "networkName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v10, CFSTR("Network Name"), a3, a4);

  return v7;
}

- (id)description
{
  return -[PrivacyProxyNetworkStatus descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PrivacyProxyNetworkStatus *v4;
  void *v5;

  v4 = -[PrivacyProxyNetworkStatus init](+[PrivacyProxyNetworkStatus allocWithZone:](PrivacyProxyNetworkStatus, "allocWithZone:", a3), "init");
  -[PrivacyProxyNetworkStatus setNetworkStatus:](v4, "setNetworkStatus:", -[PrivacyProxyNetworkStatus networkStatus](self, "networkStatus"));
  -[PrivacyProxyNetworkStatus setNetworkType:](v4, "setNetworkType:", -[PrivacyProxyNetworkStatus networkType](self, "networkType"));
  -[PrivacyProxyNetworkStatus networkName](self, "networkName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PrivacyProxyNetworkStatus setNetworkName:](v4, "setNetworkName:", v5);

  return v4;
}

- (PrivacyProxyNetworkStatus)initWithStatus:(unint64_t)a3 type:(int)a4 name:(id)a5
{
  id v9;
  PrivacyProxyNetworkStatus *v10;
  PrivacyProxyNetworkStatus *v11;
  PrivacyProxyNetworkStatus *v12;
  NSObject *v14;
  uint8_t v15[16];
  objc_super v16;

  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PrivacyProxyNetworkStatus;
  v10 = -[PrivacyProxyNetworkStatus init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_networkStatus = a3;
    v10->_networkType = a4;
    objc_storeStrong((id *)&v10->_networkName, a5);
    v12 = v11;
  }
  else
  {
    nplog_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_fault_impl(&dword_19E8FE000, v14, OS_LOG_TYPE_FAULT, "[super init] failed", v15, 2u);
    }

  }
  return v11;
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[PrivacyProxyNetworkStatus encodeWithCoder:](self, "encodeWithCoder:", v3);
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PrivacyProxyNetworkStatus)initWithData:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  PrivacyProxyNetworkStatus *v11;
  PrivacyProxyNetworkStatus *v12;
  objc_super v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3710];
  v5 = a3;
  v15 = 0;
  v6 = (void *)objc_msgSend([v4 alloc], "initForReadingFromData:error:", v5, &v15);

  v7 = v15;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v14.receiver = self;
    v14.super_class = (Class)PrivacyProxyNetworkStatus;
    v12 = -[PrivacyProxyNetworkStatus init](&v14, sel_init);
    if (v12)
      v12 = -[PrivacyProxyNetworkStatus initWithCoder:](v12, "initWithCoder:", v6);
    self = v12;
    v11 = self;
  }
  else
  {
    nplog_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v8;
      _os_log_error_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_ERROR, "Failed to create a decoder for the network status %@", buf, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (void)setNetworkStatus:(unint64_t)a3
{
  self->_networkStatus = a3;
}

- (void)setNetworkType:(int)a3
{
  self->_networkType = a3;
}

- (void)setNetworkName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
