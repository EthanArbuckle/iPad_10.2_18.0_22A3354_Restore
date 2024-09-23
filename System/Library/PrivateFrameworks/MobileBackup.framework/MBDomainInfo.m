@implementation MBDomainInfo

+ (id)domainNameForBundleID:(id)a3
{
  return +[MBDomain nameWithAppID:](MBDomain, "nameWithAppID:", a3);
}

+ (id)domainInfoWithName:(id)a3 systemApp:(BOOL)a4 remoteSize:(unint64_t)a5 localSize:(unint64_t)a6 enabled:(BOOL)a7 restricted:(BOOL)a8
{
  return -[MBDomainInfo initWithDomainName:systemApp:remoteSize:localSize:enabled:restricted:]([MBDomainInfo alloc], "initWithDomainName:systemApp:remoteSize:localSize:enabled:restricted:", a3, a4, a5, a6, a7, a8);
}

- (MBDomainInfo)initWithDomainName:(id)a3 systemApp:(BOOL)a4 remoteSize:(unint64_t)a5 localSize:(unint64_t)a6 enabled:(BOOL)a7 restricted:(BOOL)a8
{
  MBDomainInfo *v14;
  uint64_t v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)MBDomainInfo;
  v14 = -[MBDomainInfo init](&v17, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(a3, "copy");
    v14->_systemApp = a4;
    v14->_domainName = (NSString *)v15;
    v14->_remoteSize = a5;
    v14->_localSize = a6;
    v14->_enabled = a7;
    v14->_restricted = a8;
  }
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MBDomainInfo)initWithCoder:(id)a3
{
  MBDomainInfo *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MBDomainInfo;
  v4 = -[MBDomainInfo init](&v6, sel_init);
  if (v4)
  {
    v4->_domainName = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domainName"));
    v4->_systemApp = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("systemApp")), "BOOLValue");
    v4->_remoteSize = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("remoteSize")), "unsignedLongLongValue");
    v4->_localSize = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localSize")), "unsignedLongLongValue");
    v4->_enabled = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enabled")), "BOOLValue");
    v4->_restricted = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("restricted")), "BOOLValue");
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_domainName, CFSTR("domainName"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_systemApp), CFSTR("systemApp"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_remoteSize), CFSTR("remoteSize"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_localSize), CFSTR("localSize"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enabled), CFSTR("enabled"));
  objc_msgSend(a3, "encodeObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_restricted), CFSTR("restricted"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBDomainInfo;
  -[MBDomainInfo dealloc](&v3, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithDomainName:systemApp:remoteSize:localSize:enabled:restricted:", self->_domainName, self->_systemApp, self->_remoteSize, self->_localSize, self->_enabled, self->_restricted);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: domainName=%@, systemApp=%d, remoteSize=%llu, localSize=%llu, enabled=%d, restricted=%d>"), objc_opt_class(), self->_domainName, self->_systemApp, self->_remoteSize, self->_localSize, self->_enabled, self->_restricted);
}

- (BOOL)isAppDomain
{
  _BOOL4 v3;

  v3 = +[MBDomain isAppName:](MBDomain, "isAppName:", self->_domainName);
  if (v3)
    LOBYTE(v3) = !+[MBDomain isAppPlaceholderName:](MBDomain, "isAppPlaceholderName:", self->_domainName)
              && !+[MBDomain isAppPluginName:](MBDomain, "isAppPluginName:", self->_domainName)
              && !+[MBDomain isAppGroupName:](MBDomain, "isAppGroupName:", self->_domainName)
              && !self->_systemApp;
  return v3;
}

- (BOOL)isCameraRollDomain
{
  return -[NSString isEqualToString:](self->_domainName, "isEqualToString:", CFSTR("CameraRollDomain"));
}

- (NSString)bundleID
{
  return (NSString *)+[MBDomain containerIDWithName:](MBDomain, "containerIDWithName:", self->_domainName);
}

- (unint64_t)size
{
  return self->_localSize + self->_remoteSize;
}

- (BOOL)isSystemApp
{
  return self->_systemApp;
}

- (void)setSystemApp:(BOOL)a3
{
  self->_systemApp = a3;
}

- (NSString)domainName
{
  return self->_domainName;
}

- (void)setDomainName:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)remoteSize
{
  return self->_remoteSize;
}

- (void)setRemoteSize:(unint64_t)a3
{
  self->_remoteSize = a3;
}

- (unint64_t)localSize
{
  return self->_localSize;
}

- (void)setLocalSize:(unint64_t)a3
{
  self->_localSize = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (void)setRestricted:(BOOL)a3
{
  self->_restricted = a3;
}

@end
