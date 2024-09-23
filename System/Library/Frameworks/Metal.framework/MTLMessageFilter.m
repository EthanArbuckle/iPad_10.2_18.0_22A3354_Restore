@implementation MTLMessageFilter

- (id)init:(unint64_t)a3 device:(id)a4
{
  id result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTLMessageFilter;
  result = -[MTLMessageFilter init](&v7, sel_init);
  if (result)
  {
    *((_QWORD *)result + 1) = a4;
    *((_QWORD *)result + 2) = a3;
  }
  return result;
}

+ (id)filter:(unint64_t)a3 device:(id)a4
{
  return -[MTLMessageFilter init:device:]([MTLMessageFilter alloc], "init:device:", a3, a4);
}

- (void)setDevice:(id)a3
{
  self->_device = (MTLDevice *)a3;
}

- (MTLDevice)device
{
  return (MTLDevice *)objc_getProperty(self, a2, 8, 1);
}

- (unint64_t)messageType
{
  return self->_messageType;
}

@end
