@implementation ICASDeviceOrientation

- (ICASDeviceOrientation)initWithDeviceOrientation:(int64_t)a3
{
  ICASDeviceOrientation *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASDeviceOrientation;
  result = -[ICASDeviceOrientation init](&v5, sel_init);
  if (result)
    result->_deviceOrientation = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASDeviceOrientation deviceOrientation](self, "deviceOrientation", a3);
  if ((unint64_t)(v3 - 1) > 5)
    return CFSTR("unknown");
  else
    return off_1E771CF00[v3 - 1];
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

@end
