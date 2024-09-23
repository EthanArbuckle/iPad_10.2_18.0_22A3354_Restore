@implementation CRKOpenAppRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRKOpenAppRequest)initWithCoder:(id)a3
{
  id v4;
  CRKOpenAppRequest *v5;
  void *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  void *v9;
  uint64_t v10;
  NSString *activityType;
  void *v12;
  uint64_t v13;
  NSData *activityData;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CRKOpenAppRequest;
  v5 = -[CATTaskRequest initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("bundleIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("activityType"));
    v10 = objc_claimAutoreleasedReturnValue();
    activityType = v5->_activityType;
    v5->_activityType = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("activityData"));
    v13 = objc_claimAutoreleasedReturnValue();
    activityData = v5->_activityData;
    v5->_activityData = (NSData *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lockInApp"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_lockInApp = objc_msgSend(v15, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRKOpenAppRequest;
  v4 = a3;
  -[CATTaskRequest encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);
  -[CRKOpenAppRequest bundleIdentifier](self, "bundleIdentifier", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  -[CRKOpenAppRequest activityType](self, "activityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("activityType"));

  -[CRKOpenAppRequest activityData](self, "activityData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("activityData"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[CRKOpenAppRequest lockInApp](self, "lockInApp"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("lockInApp"));

}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)activityType
{
  return self->_activityType;
}

- (void)setActivityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)activityData
{
  return self->_activityData;
}

- (void)setActivityData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)lockInApp
{
  return self->_lockInApp;
}

- (void)setLockInApp:(BOOL)a3
{
  self->_lockInApp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityData, 0);
  objc_storeStrong((id *)&self->_activityType, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
