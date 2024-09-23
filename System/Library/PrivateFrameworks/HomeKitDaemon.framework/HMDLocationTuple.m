@implementation HMDLocationTuple

- (HMDLocationTuple)initWithLocation:(id)a3 reachableIPAccessoryCount:(unint64_t)a4 reachableBTLEAccessoryCount:(unint64_t)a5 reachableMediaAccessoryCount:(unint64_t)a6
{
  id v11;
  void *v12;
  HMDLocationTuple *v13;
  HMDLocationTuple *v14;
  HMDLocationTuple *v16;
  SEL v17;
  objc_super v18;

  v11 = a3;
  if (v11)
  {
    v12 = v11;
    v18.receiver = self;
    v18.super_class = (Class)HMDLocationTuple;
    v13 = -[HMDLocationTuple init](&v18, sel_init);
    v14 = v13;
    if (v13)
    {
      objc_storeStrong((id *)&v13->_location, a3);
      v14->_reachableIPAccessoryCount = a4;
      v14->_reachableBTLEAccessoryCount = a5;
      v14->_reachableMediaAccessoryCount = a6;
    }

    return v14;
  }
  else
  {
    v16 = (HMDLocationTuple *)_HMFPreconditionFailure();
    return (HMDLocationTuple *)-[HMDLocationTuple attributeDescriptions](v16, v17);
  }
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDLocationTuple location](self, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  locationAsString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Location"), v5);
  v18[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDLocationTuple reachableIPAccessoryCount](self, "reachableIPAccessoryCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Reachable IP Accessory Count"), v8);
  v18[1] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDLocationTuple reachableBTLEAccessoryCount](self, "reachableBTLEAccessoryCount"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("Reachable BTLE Accessory Count"), v11);
  v18[2] = v12;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[HMDLocationTuple reachableMediaAccessoryCount](self, "reachableMediaAccessoryCount"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("Reachable Media Accessory Count"), v14);
  v18[3] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (CLLocation)location
{
  return (CLLocation *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)reachableIPAccessoryCount
{
  return self->_reachableIPAccessoryCount;
}

- (unint64_t)reachableBTLEAccessoryCount
{
  return self->_reachableBTLEAccessoryCount;
}

- (unint64_t)reachableMediaAccessoryCount
{
  return self->_reachableMediaAccessoryCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
}

@end
