@implementation MNTraceVehicleSpeedRow

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (double)vehicleSpeed
{
  return self->_vehicleSpeed;
}

- (void)setVehicleSpeed:(double)a3
{
  self->_vehicleSpeed = a3;
}

@end
