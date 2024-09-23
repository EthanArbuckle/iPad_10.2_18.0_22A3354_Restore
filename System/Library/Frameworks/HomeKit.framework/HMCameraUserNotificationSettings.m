@implementation HMCameraUserNotificationSettings

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartBulletinBoardNotificationCondition, 0);
}

- (NSPredicate)smartBulletinBoardNotificationCondition
{
  return (NSPredicate *)objc_getProperty(self, a2, 24, 1);
}

- (BOOL)isSmartBulletinBoardNotificationEnabled
{
  return self->_smartBulletinBoardNotificationEnabled;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMCameraUserNotificationSettings)initWithCoder:(id)a3
{
  id v4;
  HMCameraUserNotificationSettings *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HMCameraUserNotificationSettings init](self, "init");
  -[HMCameraUserNotificationSettings setVersion:](v5, "setVersion:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("HMCPNS.ck.version")));
  -[HMCameraUserNotificationSettings setAccessModeChangeNotificationEnabled:](v5, "setAccessModeChangeNotificationEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMCPNS.ck.amcne")));
  -[HMCameraUserNotificationSettings setReachabilityEventNotificationEnabled:](v5, "setReachabilityEventNotificationEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMCPNS.ck.rene")));
  -[HMCameraUserNotificationSettings setSmartBulletinBoardNotificationEnabled:](v5, "setSmartBulletinBoardNotificationEnabled:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("HMCPNS.ck.sbbne")));
  v6 = (void *)MEMORY[0x1E0C99E60];
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HMCPNS.ck.sbbnc"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMCameraUserNotificationSettings setSmartBulletinBoardNotificationCondition:](v5, "setSmartBulletinBoardNotificationCondition:", v9);
  return v5;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (void)setSmartBulletinBoardNotificationEnabled:(BOOL)a3
{
  self->_smartBulletinBoardNotificationEnabled = a3;
}

- (void)setSmartBulletinBoardNotificationCondition:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void)setReachabilityEventNotificationEnabled:(BOOL)a3
{
  self->_reachabilityEventNotificationEnabled = a3;
}

- (void)setAccessModeChangeNotificationEnabled:(BOOL)a3
{
  self->_accessModeChangeNotificationEnabled = a3;
}

- (HMCameraUserNotificationSettings)init
{
  HMCameraUserNotificationSettings *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HMCameraUserNotificationSettings;
  result = -[HMCameraUserNotificationSettings init](&v3, sel_init);
  if (result)
    result->_version = 1;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  int v8;
  int v9;
  int v10;
  char v11;
  void *v13;
  void *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6
    && (v7 = -[HMCameraUserNotificationSettings version](self, "version"), v7 == objc_msgSend(v6, "version"))
    && (v8 = -[HMCameraUserNotificationSettings isAccessModeChangeNotificationEnabled](self, "isAccessModeChangeNotificationEnabled"), v8 == objc_msgSend(v6, "isAccessModeChangeNotificationEnabled"))&& (v9 = -[HMCameraUserNotificationSettings isReachabilityEventNotificationEnabled](self, "isReachabilityEventNotificationEnabled"), v9 == objc_msgSend(v6, "isReachabilityEventNotificationEnabled"))&& (v10 = -[HMCameraUserNotificationSettings isSmartBulletinBoardNotificationEnabled](self, "isSmartBulletinBoardNotificationEnabled"), v10 == objc_msgSend(v6, "isSmartBulletinBoardNotificationEnabled")))
  {
    -[HMCameraUserNotificationSettings smartBulletinBoardNotificationCondition](self, "smartBulletinBoardNotificationCondition");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "smartBulletinBoardNotificationCondition");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = HMFEqualObjects();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  int64_t v6;
  void *v7;
  unint64_t v8;

  v3 = -[HMCameraUserNotificationSettings version](self, "version");
  v4 = v3 ^ -[HMCameraUserNotificationSettings isAccessModeChangeNotificationEnabled](self, "isAccessModeChangeNotificationEnabled");
  v5 = -[HMCameraUserNotificationSettings isReachabilityEventNotificationEnabled](self, "isReachabilityEventNotificationEnabled");
  v6 = v4 ^ v5 ^ -[HMCameraUserNotificationSettings isSmartBulletinBoardNotificationEnabled](self, "isSmartBulletinBoardNotificationEnabled");
  -[HMCameraUserNotificationSettings smartBulletinBoardNotificationCondition](self, "smartBulletinBoardNotificationCondition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  HMMutableCameraUserNotificationSettings *v4;
  void *v5;

  v4 = objc_alloc_init(HMMutableCameraUserNotificationSettings);
  -[HMCameraUserNotificationSettings setVersion:](v4, "setVersion:", -[HMCameraUserNotificationSettings version](self, "version"));
  -[HMCameraUserNotificationSettings setAccessModeChangeNotificationEnabled:](v4, "setAccessModeChangeNotificationEnabled:", -[HMCameraUserNotificationSettings isAccessModeChangeNotificationEnabled](self, "isAccessModeChangeNotificationEnabled"));
  -[HMCameraUserNotificationSettings setReachabilityEventNotificationEnabled:](v4, "setReachabilityEventNotificationEnabled:", -[HMCameraUserNotificationSettings isReachabilityEventNotificationEnabled](self, "isReachabilityEventNotificationEnabled"));
  -[HMCameraUserNotificationSettings setSmartBulletinBoardNotificationEnabled:](v4, "setSmartBulletinBoardNotificationEnabled:", -[HMCameraUserNotificationSettings isSmartBulletinBoardNotificationEnabled](self, "isSmartBulletinBoardNotificationEnabled"));
  -[HMCameraUserNotificationSettings smartBulletinBoardNotificationCondition](self, "smartBulletinBoardNotificationCondition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMCameraUserNotificationSettings setSmartBulletinBoardNotificationCondition:](v4, "setSmartBulletinBoardNotificationCondition:", v5);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[HMCameraUserNotificationSettings version](self, "version"), CFSTR("HMCPNS.ck.version"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HMCameraUserNotificationSettings isAccessModeChangeNotificationEnabled](self, "isAccessModeChangeNotificationEnabled"), CFSTR("HMCPNS.ck.amcne"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HMCameraUserNotificationSettings isReachabilityEventNotificationEnabled](self, "isReachabilityEventNotificationEnabled"), CFSTR("HMCPNS.ck.rene"));
  objc_msgSend(v4, "encodeBool:forKey:", -[HMCameraUserNotificationSettings isSmartBulletinBoardNotificationEnabled](self, "isSmartBulletinBoardNotificationEnabled"), CFSTR("HMCPNS.ck.sbbne"));
  -[HMCameraUserNotificationSettings smartBulletinBoardNotificationCondition](self, "smartBulletinBoardNotificationCondition");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("HMCPNS.ck.sbbnc"));

}

- (NSString)shortDescription
{
  return (NSString *)objc_msgSend((id)objc_opt_class(), "shortDescription");
}

- (NSArray)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v17[4] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCameraUserNotificationSettings isAccessModeChangeNotificationEnabled](self, "isAccessModeChangeNotificationEnabled");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Access Mode Change"), v4);
  v17[0] = v5;
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCameraUserNotificationSettings isReachabilityEventNotificationEnabled](self, "isReachabilityEventNotificationEnabled");
  HMFBooleanToString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Reachability Event"), v7);
  v17[1] = v8;
  v9 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCameraUserNotificationSettings isSmartBulletinBoardNotificationEnabled](self, "isSmartBulletinBoardNotificationEnabled");
  HMFBooleanToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithName:value:", CFSTR("Smart Bulletin"), v10);
  v17[2] = v11;
  v12 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMCameraUserNotificationSettings smartBulletinBoardNotificationCondition](self, "smartBulletinBoardNotificationCondition");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithName:value:", CFSTR("Smart Bulletin Condition"), v13);
  v17[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v15;
}

- (int64_t)version
{
  return self->_version;
}

- (BOOL)isAccessModeChangeNotificationEnabled
{
  return self->_accessModeChangeNotificationEnabled;
}

- (BOOL)isReachabilityEventNotificationEnabled
{
  return self->_reachabilityEventNotificationEnabled;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

@end
