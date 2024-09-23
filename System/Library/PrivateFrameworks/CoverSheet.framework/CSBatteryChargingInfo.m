@implementation CSBatteryChargingInfo

- (BOOL)isChargingWithInternalWirelessAccessory
{
  return self->_chargingWithInternalWirelessAccessory;
}

- (void)setChargingWithInternalWirelessAccessory:(BOOL)a3
{
  self->_chargingWithInternalWirelessAccessory = a3;
}

- (BCBatteryDevice)internalBatteryDevice
{
  return self->_internalBatteryDevice;
}

- (void)setInternalBatteryDevice:(id)a3
{
  objc_storeStrong((id *)&self->_internalBatteryDevice, a3);
}

- (BCBatteryDevice)externalBatteryDevice
{
  return self->_externalBatteryDevice;
}

- (void)setExternalBatteryDevice:(id)a3
{
  objc_storeStrong((id *)&self->_externalBatteryDevice, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_externalBatteryDevice, 0);
  objc_storeStrong((id *)&self->_internalBatteryDevice, 0);
}

@end
