@implementation MTLIOAccelServiceDescriptor

- (MTLIOAccelServiceDescriptor)initWithAcceleratorPort:(unsigned int)a3 deviceClass:(Class)a4
{
  MTLIOAccelServiceDescriptor *v6;
  MTLIOAccelServiceDescriptor *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MTLIOAccelServiceDescriptor;
  v6 = -[MTLIOAccelServiceDescriptor init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_acceleratorPort = a3;
    v6->_deviceClass = a4;
    IOObjectRetain(a3);
  }
  return v7;
}

- (unsigned)acceleratorPort
{
  return self->_acceleratorPort;
}

- (Class)deviceClass
{
  return self->_deviceClass;
}

- (void)dealloc
{
  objc_super v3;

  IOObjectRelease(self->_acceleratorPort);
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelServiceDescriptor;
  -[MTLIOAccelServiceDescriptor dealloc](&v3, sel_dealloc);
}

@end
