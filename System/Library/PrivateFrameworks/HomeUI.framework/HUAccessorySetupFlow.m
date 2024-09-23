@implementation HUAccessorySetupFlow

- (HUAccessorySetupFlow)initWithType:(id)a3 homeKitObjects:(id)a4
{
  id v7;
  id v8;
  HUAccessorySetupFlow *v9;
  HUAccessorySetupFlow *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HUAccessorySetupFlow;
  v9 = -[HUAccessorySetupFlow init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    objc_storeStrong((id *)&v10->_homeKitObjects, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D519B8], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUAccessorySetupFlow type](self, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v4, CFSTR("type"));

  -[HUAccessorySetupFlow homeKitObjects](self, "homeKitObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v3, "appendObject:withName:", v5, CFSTR("homeKitObjects"));

  objc_msgSend(v3, "build");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)type
{
  return self->_type;
}

- (NSArray)homeKitObjects
{
  return self->_homeKitObjects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeKitObjects, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
