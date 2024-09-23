@implementation NTKWidgetComplicationMigrationInfo

- (NSDictionary)migrationMap
{
  return self->_migrationMap;
}

- (void)setMigrationMap:(id)a3
{
  objc_storeStrong((id *)&self->_migrationMap, a3);
}

- (NSDictionary)deviceCapabilityMap
{
  return self->_deviceCapabilityMap;
}

- (void)setDeviceCapabilityMap:(id)a3
{
  objc_storeStrong((id *)&self->_deviceCapabilityMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceCapabilityMap, 0);
  objc_storeStrong((id *)&self->_migrationMap, 0);
}

@end
