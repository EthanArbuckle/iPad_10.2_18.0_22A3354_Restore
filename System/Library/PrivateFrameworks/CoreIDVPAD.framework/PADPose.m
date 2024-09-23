@implementation PADPose

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  self->_pitch = a3;
}

- (double)roll
{
  return self->_roll;
}

- (void)setRoll:(double)a3
{
  self->_roll = a3;
}

- (double)yaw
{
  return self->_yaw;
}

- (void)setYaw:(double)a3
{
  self->_yaw = a3;
}

@end
