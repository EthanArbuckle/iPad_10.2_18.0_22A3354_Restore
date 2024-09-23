@implementation PrivacyProxyServiceStatusTime

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  +[PrivacyProxyServiceStatus serviceStatusString:](PrivacyProxyServiceStatus, "serviceStatusString:", -[PrivacyProxyServiceStatusTime serviceStatus](self, "serviceStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v8, CFSTR("Service Status"), a3, a4);

  v9 = (void *)MEMORY[0x1E0CB3578];
  -[PrivacyProxyServiceStatusTime serviceStatusStartTime](self, "serviceStatusStartTime");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringFromDate:dateStyle:timeStyle:", v10, 1, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v11, CFSTR("Service Status Start Time"), a3, a4);

  v12 = (void *)MEMORY[0x1E0CB3578];
  -[PrivacyProxyServiceStatusTime serviceStatusEndTime](self, "serviceStatusEndTime");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringFromDate:dateStyle:timeStyle:", v13, 1, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v14, CFSTR("Service Status End Time"), a3, a4);

  return v7;
}

- (id)description
{
  return -[PrivacyProxyServiceStatusTime descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PrivacyProxyServiceStatusTime *v4;
  void *v5;
  void *v6;

  v4 = -[PrivacyProxyServiceStatusTime init](+[PrivacyProxyServiceStatusTime allocWithZone:](PrivacyProxyServiceStatusTime, "allocWithZone:", a3), "init");
  -[PrivacyProxyServiceStatusTime setServiceStatus:](v4, "setServiceStatus:", -[PrivacyProxyServiceStatusTime serviceStatus](self, "serviceStatus"));
  -[PrivacyProxyServiceStatusTime serviceStatusStartTime](self, "serviceStatusStartTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PrivacyProxyServiceStatusTime setServiceStatusStartTime:](v4, "setServiceStatusStartTime:", v5);

  -[PrivacyProxyServiceStatusTime serviceStatusEndTime](self, "serviceStatusEndTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PrivacyProxyServiceStatusTime setServiceStatusEndTime:](v4, "setServiceStatusEndTime:", v6);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PrivacyProxyServiceStatusTime)initWithCoder:(id)a3
{
  id v4;
  PrivacyProxyServiceStatusTime *v5;
  uint64_t v6;
  NSDate *serviceStatusStartTime;
  uint64_t v8;
  NSDate *serviceStatusEndTime;
  PrivacyProxyServiceStatusTime *v10;
  NSObject *v12;
  uint8_t v13[16];
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PrivacyProxyServiceStatusTime;
  v5 = -[PrivacyProxyServiceStatusTime init](&v14, sel_init);
  if (v5)
  {
    v5->_serviceStatus = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyServiceStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivacyProxyServiceStatusStartDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    serviceStatusStartTime = v5->_serviceStatusStartTime;
    v5->_serviceStatusStartTime = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivacyProxyServiceStatusEndDate"));
    v8 = objc_claimAutoreleasedReturnValue();
    serviceStatusEndTime = v5->_serviceStatusEndTime;
    v5->_serviceStatusEndTime = (NSDate *)v8;

    v10 = v5;
  }
  else
  {
    nplog_obj();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v13 = 0;
      _os_log_fault_impl(&dword_19E8FE000, v12, OS_LOG_TYPE_FAULT, "[super init] failed", v13, 2u);
    }

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyServiceStatusTime serviceStatus](self, "serviceStatus"), CFSTR("PrivacyProxyServiceStatus"));
  -[PrivacyProxyServiceStatusTime serviceStatusStartTime](self, "serviceStatusStartTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PrivacyProxyServiceStatusStartDate"));

  -[PrivacyProxyServiceStatusTime serviceStatusEndTime](self, "serviceStatusEndTime");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("PrivacyProxyServiceStatusEndDate"));

}

- (id)diagnostics
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  +[PrivacyProxyServiceStatus serviceStatusString:](PrivacyProxyServiceStatus, "serviceStatusString:", -[PrivacyProxyServiceStatusTime serviceStatus](self, "serviceStatus"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("PrivacyProxyServiceStatus"));

  v5 = (void *)MEMORY[0x1E0CB3578];
  -[PrivacyProxyServiceStatusTime serviceStatusStartTime](self, "serviceStatusStartTime");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringFromDate:dateStyle:timeStyle:", v6, 1, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("PrivacyProxyServiceStatusStartDate"));

  v8 = (void *)MEMORY[0x1E0CB3578];
  -[PrivacyProxyServiceStatusTime serviceStatusEndTime](self, "serviceStatusEndTime");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringFromDate:dateStyle:timeStyle:", v9, 1, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("PrivacyProxyServiceStatusEndDate"));

  return v3;
}

- (unint64_t)serviceStatus
{
  return self->_serviceStatus;
}

- (void)setServiceStatus:(unint64_t)a3
{
  self->_serviceStatus = a3;
}

- (NSDate)serviceStatusStartTime
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void)setServiceStatusStartTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSDate)serviceStatusEndTime
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (void)setServiceStatusEndTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceStatusEndTime, 0);
  objc_storeStrong((id *)&self->_serviceStatusStartTime, 0);
}

@end
