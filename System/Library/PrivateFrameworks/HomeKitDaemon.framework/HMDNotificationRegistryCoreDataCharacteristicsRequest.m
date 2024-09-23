@implementation HMDNotificationRegistryCoreDataCharacteristicsRequest

- (HMDNotificationRegistryCoreDataCharacteristicsRequest)initWithRequest:(id)a3 characteristicThresholds:(id)a4
{
  id v7;
  id v8;
  HMDNotificationRegistryCoreDataCharacteristicsRequest *v9;
  HMDNotificationRegistryCoreDataCharacteristicsRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDNotificationRegistryCoreDataCharacteristicsRequest;
  v9 = -[HMDNotificationRegistryCoreDataCharacteristicsRequest init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_request, a3);
    objc_storeStrong((id *)&v10->_characteristicThresholds, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  HMDNotificationRegistryCoreDataCharacteristicsRequest *v4;
  HMDNotificationRegistryCoreDataCharacteristicsRequest *v5;
  HMDNotificationRegistryCoreDataCharacteristicsRequest *v6;
  HMDNotificationRegistryCoreDataCharacteristicsRequest *v7;
  HMDNotificationRegistryCharacteristicsRequest *request;
  void *v9;
  NSArray *characteristicThresholds;
  void *v11;
  char v12;

  v4 = (HMDNotificationRegistryCoreDataCharacteristicsRequest *)a3;
  if (v4 == self)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    v7 = v6;
    if (v6)
    {
      request = self->_request;
      -[HMDNotificationRegistryCoreDataCharacteristicsRequest request](v6, "request");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[HMDNotificationRegistryCharacteristicsRequest isEqual:](request, "isEqual:", v9))
      {
        characteristicThresholds = self->_characteristicThresholds;
        -[HMDNotificationRegistryCoreDataCharacteristicsRequest characteristicThresholds](v7, "characteristicThresholds");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[NSArray isEqual:](characteristicThresholds, "isEqual:", v11);

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (HMDNotificationRegistryCharacteristicsRequest)request
{
  return (HMDNotificationRegistryCharacteristicsRequest *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)characteristicThresholds
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_characteristicThresholds, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
