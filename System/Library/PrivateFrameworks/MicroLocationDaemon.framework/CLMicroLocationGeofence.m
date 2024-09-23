@implementation CLMicroLocationGeofence

- (CLMicroLocationGeofence)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMicroLocationGeofence;
  return -[CLMicroLocationGeofence init](&v3, sel_init);
}

- (NSString)regionId
{
  return self->_regionId;
}

- (void)setRegionId:(id)a3
{
  objc_storeStrong((id *)&self->_regionId, a3);
}

- (CLLocation)regionCenterLocation
{
  return self->_regionCenterLocation;
}

- (void)setRegionCenterLocation:(id)a3
{
  objc_storeStrong((id *)&self->_regionCenterLocation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_regionCenterLocation, 0);
  objc_storeStrong((id *)&self->_regionId, 0);
}

@end
