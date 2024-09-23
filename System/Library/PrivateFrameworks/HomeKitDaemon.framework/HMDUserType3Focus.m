@implementation HMDUserType3Focus

- (HMDUserType3Focus)initWithEnabled:(BOOL)a3 updatedTime:(id)a4 userActionTriggered:(BOOL)a5
{
  id v9;
  HMDUserType3Focus *v10;
  HMDUserType3Focus *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HMDUserType3Focus;
  v10 = -[HMDUserType3Focus init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_enabled = a3;
    objc_storeStrong((id *)&v10->_updatedTime, a4);
    v11->_userActionTriggered = a5;
  }

  return v11;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUserType3Focus isEnabled](self, "isEnabled");
  HMFBooleanToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Enabled"), v4);
  v6 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUserType3Focus updatedTime](self, "updatedTime", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_localTimeDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Updated Time"), v8);
  v15[1] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDUserType3Focus isUserActionTriggered](self, "isUserActionTriggered");
  HMFBooleanToString();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("User Action Triggered"), v11);
  v15[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (NSDate)updatedTime
{
  return self->_updatedTime;
}

- (BOOL)isUserActionTriggered
{
  return self->_userActionTriggered;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updatedTime, 0);
}

@end
