@implementation MTSDeviceSetupRoom

- (MTSDeviceSetupRoom)initWithName:(id)a3
{
  id v4;
  void *v5;
  MTSDeviceSetupRoom *v6;
  uint64_t v7;
  NSString *name;
  MTSDeviceSetupRoom *v10;
  SEL v11;
  _NSZone *v12;
  objc_super v13;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    v13.receiver = self;
    v13.super_class = (Class)MTSDeviceSetupRoom;
    v6 = -[MTSDeviceSetupRoom init](&v13, sel_init);
    if (v6)
    {
      v7 = objc_msgSend(v5, "copy");
      name = v6->_name;
      v6->_name = (NSString *)v7;

    }
    return v6;
  }
  else
  {
    v10 = (MTSDeviceSetupRoom *)_HMFPreconditionFailure();
    return (MTSDeviceSetupRoom *)-[MTSDeviceSetupRoom copyWithZone:](v10, v11, v12);
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[MTSDeviceSetupRoom name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[MTSDeviceSetupRoom name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (MTSDeviceSetupRoom)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MTSDeviceSetupRoom *v6;
  MTSDeviceSetupRoom *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("MTSDSR.ck.name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[MTSDeviceSetupRoom initWithName:](self, "initWithName:", v5);
    v7 = v6;
  }
  else
  {
    v8 = (void *)MEMORY[0x23493F978]();
    v6 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = 0;
      _os_log_impl(&dword_2344FE000, v9, OS_LOG_TYPE_ERROR, "%{public}@Could not initialize from decoded name: %@", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTSDeviceSetupRoom name](self, "name");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("MTSDSR.ck.name"));

}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
