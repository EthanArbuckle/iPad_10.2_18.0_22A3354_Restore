@implementation SSHBHIDProximitySample

- (NSString)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Mask: %d, Level: %d"), -[SSHBHIDProximitySample detectionMask](self, "detectionMask"), -[SSHBHIDProximitySample level](self, "level"));
}

- (id)csv
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d,%d"), -[SSHBHIDProximitySample detectionMask](self, "detectionMask"), -[SSHBHIDProximitySample level](self, "level"));
}

- (unsigned)detectionMask
{
  return self->_detectionMask;
}

- (void)setDetectionMask:(unsigned int)a3
{
  self->_detectionMask = a3;
}

- (unsigned)level
{
  return self->_level;
}

- (void)setLevel:(unsigned int)a3
{
  self->_level = a3;
}

@end
