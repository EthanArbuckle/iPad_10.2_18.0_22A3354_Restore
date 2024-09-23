@implementation _MFObjectProperty

+ (id)objectPropertyWithClass:(Class)a3 property:(SEL)a4
{
  _MFObjectProperty *v6;

  v6 = objc_alloc_init(_MFObjectProperty);
  -[_MFObjectProperty setClass:](v6, "setClass:", a3);
  -[_MFObjectProperty setProperty:](v6, "setProperty:", a4);
  return v6;
}

- (Class)class
{
  return self->_class;
}

- (void)setClass:(Class)a3
{
  self->_class = a3;
}

- (SEL)property
{
  return self->_property;
}

- (void)setProperty:(SEL)a3
{
  self->_property = a3;
}

@end
