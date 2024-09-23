@implementation CAMModeAndDeviceConfigurationChangeListener

- (int64_t)desiredMode
{
  return self->_desiredMode;
}

- (void)setDesiredMode:(int64_t)a3
{
  self->_desiredMode = a3;
}

- (int64_t)desiredDevicePosition
{
  return self->_desiredDevicePosition;
}

- (void)setDesiredDevicePosition:(int64_t)a3
{
  self->_desiredDevicePosition = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
