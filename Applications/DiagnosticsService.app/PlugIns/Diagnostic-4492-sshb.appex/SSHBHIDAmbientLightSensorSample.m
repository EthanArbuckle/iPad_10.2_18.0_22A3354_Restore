@implementation SSHBHIDAmbientLightSensorSample

- (NSString)description
{
  id v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  id v7;

  v3 = objc_alloc((Class)NSMutableString);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v3, "initWithString:", v6);

  objc_msgSend(v7, "appendFormat:", CFSTR("\nlevel: %u"), -[SSHBHIDAmbientLightSensorSample level](self, "level"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\nrawchannel0: %u"), -[SSHBHIDAmbientLightSensorSample rawchannel0](self, "rawchannel0"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\nrawchannel1: %u"), -[SSHBHIDAmbientLightSensorSample rawchannel1](self, "rawchannel1"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\nrawchannel2: %u"), -[SSHBHIDAmbientLightSensorSample rawchannel2](self, "rawchannel2"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\nrawchannel3: %u"), -[SSHBHIDAmbientLightSensorSample rawchannel3](self, "rawchannel3"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\nbrightnesschange: %u"), -[SSHBHIDAmbientLightSensorSample brightnesschange](self, "brightnesschange"));
  objc_msgSend(v7, "appendFormat:", CFSTR("\norientation: %u"), -[SSHBHIDAmbientLightSensorSample orientation](self, "orientation"));
  return (NSString *)v7;
}

- (id)csv
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u,%u,%u,%u,%u,%u,%u"), -[SSHBHIDAmbientLightSensorSample level](self, "level"), -[SSHBHIDAmbientLightSensorSample rawchannel0](self, "rawchannel0"), -[SSHBHIDAmbientLightSensorSample rawchannel1](self, "rawchannel1"), -[SSHBHIDAmbientLightSensorSample rawchannel2](self, "rawchannel2"), -[SSHBHIDAmbientLightSensorSample rawchannel3](self, "rawchannel3"), -[SSHBHIDAmbientLightSensorSample brightnesschange](self, "brightnesschange"), -[SSHBHIDAmbientLightSensorSample orientation](self, "orientation"));
}

- (unsigned)level
{
  return self->_level;
}

- (void)setLevel:(unsigned int)a3
{
  self->_level = a3;
}

- (unsigned)rawchannel0
{
  return self->_rawchannel0;
}

- (void)setRawchannel0:(unsigned int)a3
{
  self->_rawchannel0 = a3;
}

- (unsigned)rawchannel1
{
  return self->_rawchannel1;
}

- (void)setRawchannel1:(unsigned int)a3
{
  self->_rawchannel1 = a3;
}

- (unsigned)rawchannel2
{
  return self->_rawchannel2;
}

- (void)setRawchannel2:(unsigned int)a3
{
  self->_rawchannel2 = a3;
}

- (unsigned)rawchannel3
{
  return self->_rawchannel3;
}

- (void)setRawchannel3:(unsigned int)a3
{
  self->_rawchannel3 = a3;
}

- (unsigned)brightnesschange
{
  return self->_brightnesschange;
}

- (void)setBrightnesschange:(unsigned int)a3
{
  self->_brightnesschange = a3;
}

- (unsigned)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(unsigned int)a3
{
  self->_orientation = a3;
}

@end
