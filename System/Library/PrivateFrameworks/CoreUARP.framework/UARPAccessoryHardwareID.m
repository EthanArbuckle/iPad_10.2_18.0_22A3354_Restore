@implementation UARPAccessoryHardwareID

- (UARPAccessoryHardwareID)init
{
  -[UARPAccessoryHardwareID doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPAccessoryHardwareID)initWithTransport:(int64_t)a3
{
  UARPAccessoryHardwareID *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UARPAccessoryHardwareID;
  result = -[UARPAccessoryHardwareID init](&v5, sel_init);
  if (result)
    result->_transport = a3;
  return result;
}

- (int64_t)transport
{
  return self->_transport;
}

@end
