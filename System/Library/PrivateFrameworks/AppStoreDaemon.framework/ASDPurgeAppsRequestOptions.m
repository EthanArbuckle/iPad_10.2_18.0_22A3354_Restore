@implementation ASDPurgeAppsRequestOptions

- (ASDPurgeAppsRequestOptions)initWithVolume:(id)a3 urgency:(int64_t)a4
{
  id v7;
  ASDPurgeAppsRequestOptions *v8;
  ASDPurgeAppsRequestOptions *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ASDPurgeAppsRequestOptions;
  v8 = -[ASDPurgeAppsRequestOptions init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_volume, a3);
    v9->_urgency = a4;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASDPurgeAppsRequestOptions *v5;
  uint64_t v6;
  NSArray *apps;
  uint64_t v8;
  NSNumber *desiredPurgeAmount;
  uint64_t v10;
  NSString *volume;

  v5 = -[ASDPurgeAppsRequestOptions init](+[ASDPurgeAppsRequestOptions allocWithZone:](ASDPurgeAppsRequestOptions, "allocWithZone:"), "init");
  v6 = -[NSArray copyWithZone:](self->_apps, "copyWithZone:", a3);
  apps = v5->_apps;
  v5->_apps = (NSArray *)v6;

  v8 = -[NSNumber copyWithZone:](self->_desiredPurgeAmount, "copyWithZone:", a3);
  desiredPurgeAmount = v5->_desiredPurgeAmount;
  v5->_desiredPurgeAmount = (NSNumber *)v8;

  v5->_offloadOnly = self->_offloadOnly;
  v5->_performAvailablityCheck = self->_performAvailablityCheck;
  v5->_skipLaunchCheck = self->_skipLaunchCheck;
  v5->_urgency = self->_urgency;
  v10 = -[NSString copyWithZone:](self->_volume, "copyWithZone:", a3);
  volume = v5->_volume;
  v5->_volume = (NSString *)v10;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDPurgeAppsRequestOptions)initWithCoder:(id)a3
{
  id v4;
  ASDPurgeAppsRequestOptions *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *apps;
  uint64_t v11;
  NSNumber *desiredPurgeAmount;
  uint64_t v13;
  NSString *volume;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ASDPurgeAppsRequestOptions;
  v5 = -[ASDRequestOptions initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("apps"));
    v9 = objc_claimAutoreleasedReturnValue();
    apps = v5->_apps;
    v5->_apps = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("desiredPurgeAmount"));
    v11 = objc_claimAutoreleasedReturnValue();
    desiredPurgeAmount = v5->_desiredPurgeAmount;
    v5->_desiredPurgeAmount = (NSNumber *)v11;

    v5->_offloadOnly = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("offloadOnly"));
    v5->_performAvailablityCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("performAvailablityCheck"));
    v5->_skipLaunchCheck = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("skipLaunchCheck"));
    v5->_urgency = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("urgency"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("volume"));
    v13 = objc_claimAutoreleasedReturnValue();
    volume = v5->_volume;
    v5->_volume = (NSString *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  -[ASDPurgeAppsRequestOptions apps](self, "apps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("apps"));

  -[ASDPurgeAppsRequestOptions desiredPurgeAmount](self, "desiredPurgeAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("desiredPurgeAmount"));

  objc_msgSend(v4, "encodeBool:forKey:", -[ASDPurgeAppsRequestOptions offloadOnly](self, "offloadOnly"), CFSTR("offloadOnly"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDPurgeAppsRequestOptions performAvailablityCheck](self, "performAvailablityCheck"), CFSTR("performAvailablityCheck"));
  objc_msgSend(v4, "encodeBool:forKey:", -[ASDPurgeAppsRequestOptions skipLaunchCheck](self, "skipLaunchCheck"), CFSTR("skipLaunchCheck"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[ASDPurgeAppsRequestOptions urgency](self, "urgency"), CFSTR("urgency"));
  -[ASDPurgeAppsRequestOptions volume](self, "volume");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("volume"));

  v8.receiver = self;
  v8.super_class = (Class)ASDPurgeAppsRequestOptions;
  -[ASDRequestOptions encodeWithCoder:](&v8, sel_encodeWithCoder_, v4);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[ASDPurgeAppsRequestOptions urgency](self, "urgency");
  -[ASDPurgeAppsRequestOptions desiredPurgeAmount](self, "desiredPurgeAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDPurgeAppsRequestOptions volume](self, "volume");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASDPurgeAppsRequestOptions skipLaunchCheck](self, "skipLaunchCheck");
  -[ASDPurgeAppsRequestOptions apps](self, "apps");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsJoinedByString:", CFSTR(","));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ {urgency = %ld, desired = %@ volume: %@ skip launch check: %d apps: [%@]}"), v4, v5, v6, v7, v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSArray)apps
{
  return self->_apps;
}

- (void)setApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)desiredPurgeAmount
{
  return self->_desiredPurgeAmount;
}

- (void)setDesiredPurgeAmount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)offloadOnly
{
  return self->_offloadOnly;
}

- (void)setOffloadOnly:(BOOL)a3
{
  self->_offloadOnly = a3;
}

- (BOOL)performAvailablityCheck
{
  return self->_performAvailablityCheck;
}

- (void)setPerformAvailablityCheck:(BOOL)a3
{
  self->_performAvailablityCheck = a3;
}

- (BOOL)skipLaunchCheck
{
  return self->_skipLaunchCheck;
}

- (void)setSkipLaunchCheck:(BOOL)a3
{
  self->_skipLaunchCheck = a3;
}

- (int64_t)urgency
{
  return self->_urgency;
}

- (void)setUrgency:(int64_t)a3
{
  self->_urgency = a3;
}

- (NSString)volume
{
  return self->_volume;
}

- (void)setVolume:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_desiredPurgeAmount, 0);
  objc_storeStrong((id *)&self->_apps, 0);
}

@end
