@implementation ICASInterfaceOrientation

- (ICASInterfaceOrientation)initWithInterfaceOrientation:(int64_t)a3
{
  ICASInterfaceOrientation *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICASInterfaceOrientation;
  result = -[ICASInterfaceOrientation init](&v5, sel_init);
  if (result)
    result->_interfaceOrientation = a3;
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3;

  v3 = -[ICASInterfaceOrientation interfaceOrientation](self, "interfaceOrientation", a3);
  if ((unint64_t)(v3 - 1) > 3)
    return CFSTR("unknown");
  else
    return off_1E771C8C8[v3 - 1];
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

@end
