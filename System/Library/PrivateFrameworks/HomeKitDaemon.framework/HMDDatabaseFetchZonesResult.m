@implementation HMDDatabaseFetchZonesResult

- (HMDDatabaseFetchZonesResult)initWithLocalZone:(id)a3 cloudZone:(id)a4
{
  id v7;
  id v8;
  HMDDatabaseFetchZonesResult *v9;
  HMDDatabaseFetchZonesResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDDatabaseFetchZonesResult;
  v9 = -[HMDDatabaseFetchZonesResult init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_localZone, a3);
    objc_storeStrong((id *)&v10->_cloudZone, a4);
  }

  return v10;
}

- (HMBLocalZone)localZone
{
  return (HMBLocalZone *)objc_getProperty(self, a2, 8, 1);
}

- (HMBCloudZone)cloudZone
{
  return (HMBCloudZone *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudZone, 0);
  objc_storeStrong((id *)&self->_localZone, 0);
}

@end
