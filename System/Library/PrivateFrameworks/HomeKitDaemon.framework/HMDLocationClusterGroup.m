@implementation HMDLocationClusterGroup

- (HMDLocationClusterGroup)initWithCenter:(id)a3
{
  id v5;
  void *v6;
  HMDLocationClusterGroup *v7;
  HMDLocationClusterGroup *v8;
  uint64_t v9;
  NSMutableArray *locations;
  HMDLocationClusterGroup *v12;
  SEL v13;
  objc_super v14;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v14.receiver = self;
    v14.super_class = (Class)HMDLocationClusterGroup;
    v7 = -[HMDLocationClusterGroup init](&v14, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_center, a3);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v9 = objc_claimAutoreleasedReturnValue();
      locations = v8->_locations;
      v8->_locations = (NSMutableArray *)v9;

    }
    return v8;
  }
  else
  {
    v12 = (HMDLocationClusterGroup *)_HMFPreconditionFailure();
    return (HMDLocationClusterGroup *)-[HMDLocationClusterGroup attributeDescriptions](v12, v13);
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
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDLocationClusterGroup center](self, "center");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  locationAsString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Center"), v5);
  v12[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDLocationClusterGroup locations](self, "locations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("Locations"), v8);
  v12[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CLLocation)center
{
  return (CLLocation *)objc_getProperty(self, a2, 8, 1);
}

- (NSMutableArray)locations
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_center, 0);
}

@end
