@implementation HMDAnalyticsHAPServiceData

- (HMDAnalyticsHAPServiceData)initWithServiceType:(id)a3 isPrimary:(BOOL)a4 ownerUser:(BOOL)a5
{
  id v9;
  HMDAnalyticsHAPServiceData *v10;
  HMDAnalyticsHAPServiceData *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HMDAnalyticsHAPServiceData;
  v10 = -[HMDAnalyticsHAPServiceData init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_serviceType, a3);
    v11->_isPrimary = a4;
    v11->_ownerUser = a5;
  }

  return v11;
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (BOOL)ownerUser
{
  return self->_ownerUser;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceType, 0);
}

@end
