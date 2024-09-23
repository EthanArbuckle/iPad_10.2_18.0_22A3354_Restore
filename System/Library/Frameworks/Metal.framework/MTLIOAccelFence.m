@implementation MTLIOAccelFence

- (MTLDevice)device
{
  return self->_device;
}

- (MTLIOAccelFence)initWithDevice:(id)a3 fenceIndex:(unsigned int)a4
{
  MTLIOAccelFence *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLIOAccelFence;
  v6 = -[_MTLObjectWithLabel init](&v8, sel_init);
  if (v6)
  {
    v6->_device = (MTLDevice *)a3;
    v6->_fenceIndex = a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_fenceIndex)
    -[MTLDevice releaseFenceIndex:](self->_device, "releaseFenceIndex:");
  self->_fenceIndex = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLIOAccelFence;
  -[_MTLObjectWithLabel dealloc](&v3, sel_dealloc);
}

@end
