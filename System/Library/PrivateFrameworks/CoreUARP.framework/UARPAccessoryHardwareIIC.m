@implementation UARPAccessoryHardwareIIC

- (UARPAccessoryHardwareIIC)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UARPAccessoryHardwareIIC;
  return -[UARPAccessoryHardwareID initWithTransport:](&v3, sel_initWithTransport_, 10);
}

- (id)description
{
  return CFSTR("IIC");
}

@end
