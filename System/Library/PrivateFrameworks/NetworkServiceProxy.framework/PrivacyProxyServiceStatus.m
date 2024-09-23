@implementation PrivacyProxyServiceStatus

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_networkStatuses, 0);
}

- (id)serialize
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  -[PrivacyProxyServiceStatus encodeWithCoder:](self, "encodeWithCoder:", v3);
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyServiceStatus serviceStatus](self, "serviceStatus"), CFSTR("PrivacyProxyServiceStatus"));
  -[PrivacyProxyServiceStatus networkStatuses](self, "networkStatuses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PrivacyProxyNetworkStatuses"));

  -[PrivacyProxyServiceStatus details](self, "details");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("PrivacyProxyDetails"));

}

- (unint64_t)serviceStatus
{
  return self->_serviceStatus;
}

- (NSArray)networkStatuses
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)details
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (PrivacyProxyServiceStatus)initWithData:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  PrivacyProxyServiceStatus *v11;
  PrivacyProxyServiceStatus *v12;
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
    v14.super_class = (Class)PrivacyProxyServiceStatus;
    v12 = -[PrivacyProxyServiceStatus init](&v14, sel_init);
    if (v12)
      v12 = -[PrivacyProxyServiceStatus initWithCoder:](v12, "initWithCoder:", v6);
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
      _os_log_error_impl(&dword_19E8FE000, v10, OS_LOG_TYPE_ERROR, "Failed to create a decoder for the service status %@", buf, 0xCu);
    }

    v11 = 0;
  }

  return v11;
}

- (PrivacyProxyServiceStatus)initWithCoder:(id)a3
{
  id v4;
  PrivacyProxyServiceStatus *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSArray *networkStatuses;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSDictionary *details;
  PrivacyProxyServiceStatus *v20;
  uint8_t buf[16];
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PrivacyProxyServiceStatus;
  v5 = -[PrivacyProxyServiceStatus init](&v23, sel_init);
  if (v5)
  {
    v5->_serviceStatus = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyServiceStatus"));
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("PrivacyProxyNetworkStatuses"));
    v9 = objc_claimAutoreleasedReturnValue();
    networkStatuses = v5->_networkStatuses;
    v5->_networkStatuses = (NSArray *)v9;

    v11 = objc_alloc(MEMORY[0x1E0C99E60]);
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    v16 = objc_opt_class();
    v17 = (void *)objc_msgSend(v11, "initWithObjects:", v12, v13, v14, v15, v16, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("PrivacyProxyDetails"));
    v18 = objc_claimAutoreleasedReturnValue();
    details = v5->_details;
    v5->_details = (NSDictionary *)v18;

    v20 = v5;
  }
  else
  {
    nplog_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_19E8FE000, v8, OS_LOG_TYPE_FAULT, "[super init] failed", buf, 2u);
    }
  }

  return v5;
}

+ (id)serviceStatusString:(unint64_t)a3
{
  if (a3 > 7)
    return CFSTR("Invalid");
  else
    return off_1E4137528[a3];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  +[PrivacyProxyServiceStatus serviceStatusString:](PrivacyProxyServiceStatus, "serviceStatusString:", -[PrivacyProxyServiceStatus serviceStatus](self, "serviceStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v8, CFSTR("Service Status"), a3, a4);

  -[PrivacyProxyServiceStatus networkStatuses](self, "networkStatuses");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v9, CFSTR("Network Statuses"), a3, a4);

  -[PrivacyProxyServiceStatus details](self, "details");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v10, CFSTR("Details"), a3, a4);

  return v7;
}

- (id)description
{
  return -[PrivacyProxyServiceStatus descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PrivacyProxyServiceStatus *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[PrivacyProxyServiceStatus init](+[PrivacyProxyServiceStatus allocWithZone:](PrivacyProxyServiceStatus, "allocWithZone:", a3), "init");
  -[PrivacyProxyServiceStatus setServiceStatus:](v4, "setServiceStatus:", -[PrivacyProxyServiceStatus serviceStatus](self, "serviceStatus"));
  -[PrivacyProxyServiceStatus networkStatuses](self, "networkStatuses");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PrivacyProxyServiceStatus setNetworkStatuses:](v4, "setNetworkStatuses:", v5);

  -[PrivacyProxyServiceStatus details](self, "details");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  -[PrivacyProxyServiceStatus setDetails:](v4, "setDetails:", v7);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setServiceStatus:(unint64_t)a3
{
  self->_serviceStatus = a3;
}

- (void)setNetworkStatuses:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)setDetails:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

@end
