@implementation HMDNotificationRegistryCoreDataCharacteristicsRequestResult

- (HMDNotificationRegistryCoreDataCharacteristicsRequestResult)initWithCoreDataRequest:(id)a3 didSucceed:(BOOL)a4 didModify:(BOOL)a5 didModifyThresholdOnly:(BOOL)a6 modifiedCharacteristics:(id)a7
{
  id v13;
  id v14;
  HMDNotificationRegistryCoreDataCharacteristicsRequestResult *v15;
  HMDNotificationRegistryCoreDataCharacteristicsRequestResult *v16;
  objc_super v18;

  v13 = a3;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)HMDNotificationRegistryCoreDataCharacteristicsRequestResult;
  v15 = -[HMDNotificationRegistryCoreDataCharacteristicsRequestResult init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_coreDataRequest, a3);
    v16->_didSucceed = a4;
    v16->_didModify = a5;
    objc_storeStrong((id *)&v16->_modifiedCharacteristics, a7);
    v16->_didModifyThresholdOnly = a6;
  }

  return v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HMDNotificationRegistryCoreDataCharacteristicsRequest *coreDataRequest;
  void *v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    coreDataRequest = self->_coreDataRequest;
    objc_msgSend(v6, "coreDataRequest");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[HMDNotificationRegistryCoreDataCharacteristicsRequest isEqual:](coreDataRequest, "isEqual:", v9);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HMDNotificationRegistryCoreDataCharacteristicsRequest)coreDataRequest
{
  return (HMDNotificationRegistryCoreDataCharacteristicsRequest *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
}

- (BOOL)didModify
{
  return self->_didModify;
}

- (BOOL)didModifyThresholdOnly
{
  return self->_didModifyThresholdOnly;
}

- (NSArray)modifiedCharacteristics
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedCharacteristics, 0);
  objc_storeStrong((id *)&self->_coreDataRequest, 0);
}

@end
