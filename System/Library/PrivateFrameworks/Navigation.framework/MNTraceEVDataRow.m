@implementation MNTraceEVDataRow

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (VGVehicle)vehicle
{
  return self->_vehicle;
}

- (void)setVehicle:(id)a3
{
  objc_storeStrong((id *)&self->_vehicle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicle, 0);
}

@end
