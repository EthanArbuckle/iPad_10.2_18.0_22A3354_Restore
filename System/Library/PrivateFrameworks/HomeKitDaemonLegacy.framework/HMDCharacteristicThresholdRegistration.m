@implementation HMDCharacteristicThresholdRegistration

- (HMDCharacteristicThresholdRegistration)initWithClientID:(id)a3 updateThreshold:(id)a4
{
  id v6;
  id v7;
  HMDCharacteristicThresholdRegistration *v8;
  uint64_t v9;
  NSString *clientID;
  uint64_t v11;
  NSNumber *updateThreshold;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDCharacteristicThresholdRegistration;
  v8 = -[HMDCharacteristicThresholdRegistration init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    clientID = v8->_clientID;
    v8->_clientID = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    updateThreshold = v8->_updateThreshold;
    v8->_updateThreshold = (NSNumber *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  HMDCharacteristicThresholdRegistration *v4;
  HMDCharacteristicThresholdRegistration *v5;
  HMDCharacteristicThresholdRegistration *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDCharacteristicThresholdRegistration *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDCharacteristicThresholdRegistration clientID](self, "clientID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDCharacteristicThresholdRegistration clientID](v6, "clientID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDCharacteristicThresholdRegistration clientID](self, "clientID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSString)clientID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSNumber)updateThreshold
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateThreshold, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end
