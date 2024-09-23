@implementation CMADeviceMotion

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)quaternion
{
  double x;
  double y;
  double z;
  double w;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  x = self->_quaternion.x;
  y = self->_quaternion.y;
  z = self->_quaternion.z;
  w = self->_quaternion.w;
  result.var3 = w;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setQuaternion:(id)a3
{
  self->_quaternion = ($BD458D890A0AD74B3ABF726E1329EF14)a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)rotationRate
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_rotationRate.x;
  y = self->_rotationRate.y;
  z = self->_rotationRate.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setRotationRate:(id)a3
{
  self->_rotationRate = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

- ($1AB5FA073B851C12C2339EC22442E995)acceleration
{
  double x;
  double y;
  double z;
  $1AB5FA073B851C12C2339EC22442E995 result;

  x = self->_acceleration.x;
  y = self->_acceleration.y;
  z = self->_acceleration.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (void)setAcceleration:(id)a3
{
  self->_acceleration = ($83A9B0F16167884A9BDC45564D3E7367)a3;
}

@end
