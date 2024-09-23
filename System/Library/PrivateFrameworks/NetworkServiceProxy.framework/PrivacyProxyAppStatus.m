@implementation PrivacyProxyAppStatus

- (id)appStatusString
{
  unint64_t v2;

  v2 = -[PrivacyProxyAppStatus appStatus](self, "appStatus");
  if (v2 > 2)
    return CFSTR("Invalid");
  else
    return off_1E4137568[v2];
}

- (id)descriptionWithIndent:(int)a3 options:(unint64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 0);
  -[PrivacyProxyAppStatus appStatusString](self, "appStatusString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v8, CFSTR("App Status"), a3, a4);

  -[PrivacyProxyAppStatus bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v9, CFSTR("Bundle ID"), a3, a4);

  -[PrivacyProxyAppStatus path](self, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v10, CFSTR("Path"), a3, a4);

  -[PrivacyProxyAppStatus activeDate](self, "activeDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendPrettyObject:withName:andIndent:options:](v7, v11, CFSTR("Active Date"), a3, a4);

  return v7;
}

- (id)description
{
  return -[PrivacyProxyAppStatus descriptionWithIndent:options:](self, "descriptionWithIndent:options:", 0, 14);
}

- (id)copyWithZone:(_NSZone *)a3
{
  PrivacyProxyAppStatus *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[PrivacyProxyAppStatus init](+[PrivacyProxyAppStatus allocWithZone:](PrivacyProxyAppStatus, "allocWithZone:", a3), "init");
  -[PrivacyProxyAppStatus setAppStatus:](v4, "setAppStatus:", -[PrivacyProxyAppStatus appStatus](self, "appStatus"));
  -[PrivacyProxyAppStatus bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PrivacyProxyAppStatus setBundleIdentifier:](v4, "setBundleIdentifier:", v5);

  -[PrivacyProxyAppStatus path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PrivacyProxyAppStatus setPath:](v4, "setPath:", v6);

  -[PrivacyProxyAppStatus activeDate](self, "activeDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PrivacyProxyAppStatus setActiveDate:](v4, "setActiveDate:", v7);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PrivacyProxyAppStatus)initWithStatus:(unint64_t)a3 bundleID:(id)a4 path:(id)a5 activeDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  PrivacyProxyAppStatus *v14;
  PrivacyProxyAppStatus *v15;
  PrivacyProxyAppStatus *v16;
  NSObject *v18;
  uint8_t v19[16];
  objc_super v20;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v20.receiver = self;
  v20.super_class = (Class)PrivacyProxyAppStatus;
  v14 = -[PrivacyProxyAppStatus init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_appStatus = a3;
    objc_storeStrong((id *)&v14->_bundleIdentifier, a4);
    objc_storeStrong((id *)&v15->_path, a5);
    objc_storeStrong((id *)&v15->_activeDate, a6);
    v16 = v15;
  }
  else
  {
    nplog_obj();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_fault_impl(&dword_19E8FE000, v18, OS_LOG_TYPE_FAULT, "[super init] failed", v19, 2u);
    }

  }
  return v15;
}

- (PrivacyProxyAppStatus)initWithCoder:(id)a3
{
  id v4;
  PrivacyProxyAppStatus *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSString *path;
  uint64_t v10;
  NSDate *activeDate;
  PrivacyProxyAppStatus *v12;
  NSObject *v14;
  uint8_t v15[16];
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PrivacyProxyAppStatus;
  v5 = -[PrivacyProxyAppStatus init](&v16, sel_init);
  if (v5)
  {
    v5->_appStatus = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("PrivacyProxyAppStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivacyProxyAppBundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivacyProxyAppPath"));
    v8 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PrivacyProxyAppActiveDate"));
    v10 = objc_claimAutoreleasedReturnValue();
    activeDate = v5->_activeDate;
    v5->_activeDate = (NSDate *)v10;

    v12 = v5;
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
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[PrivacyProxyAppStatus appStatus](self, "appStatus"), CFSTR("PrivacyProxyAppStatus"));
  -[PrivacyProxyAppStatus bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("PrivacyProxyAppBundleID"));

  -[PrivacyProxyAppStatus path](self, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("PrivacyProxyAppPath"));

  -[PrivacyProxyAppStatus activeDate](self, "activeDate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("PrivacyProxyAppActiveDate"));

}

- (unint64_t)appStatus
{
  return self->_appStatus;
}

- (void)setAppStatus:(unint64_t)a3
{
  self->_appStatus = a3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)path
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDate)activeDate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setActiveDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeDate, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
