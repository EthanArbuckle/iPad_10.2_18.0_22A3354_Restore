@implementation MTLCaptureScope

- (MTLCaptureScope)initWithDevice:(id)a3 commandQueue:(id)a4
{
  MTLCaptureScope *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTLCaptureScope;
  v6 = -[_MTLObjectWithLabel init](&v8, sel_init);
  if (v6)
  {
    v6->_device = (MTLDevice *)a3;
    v6->_commandQueue = (MTLCommandQueue *)a4;
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTLCaptureScope;
  -[_MTLObjectWithLabel dealloc](&v3, sel_dealloc);
}

- (MTLDevice)device
{
  return self->_device;
}

- (MTLCommandQueue)commandQueue
{
  return self->_commandQueue;
}

@end
