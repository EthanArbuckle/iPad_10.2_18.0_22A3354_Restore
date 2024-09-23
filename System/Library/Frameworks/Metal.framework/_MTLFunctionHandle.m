@implementation _MTLFunctionHandle

- (unint64_t)functionType
{
  return self->_functionType;
}

- (NSString)name
{
  return self->_name;
}

- (MTLDevice)device
{
  return self->_device;
}

- (_MTLFunctionHandle)initWithFunctionType:(unint64_t)a3 name:(id)a4 device:(id)a5
{
  _MTLFunctionHandle *v8;
  _MTLFunctionHandle *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_MTLFunctionHandle;
  v8 = -[_MTLFunctionHandle init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_functionType = a3;
    v8->_name = (NSString *)a4;
    v9->_device = (MTLDevice *)a5;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTLFunctionHandle;
  -[_MTLFunctionHandle dealloc](&v3, sel_dealloc);
}

@end
