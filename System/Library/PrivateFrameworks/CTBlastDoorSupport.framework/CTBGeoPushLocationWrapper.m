@implementation CTBGeoPushLocationWrapper

- (CTBGeoPushLocationWrapper)initWithWrapped:(optional<ctb::GeoPushLocation> *)a3
{
  CTBGeoPushLocationWrapper *result;
  $BF50F9716EBAD3A72E40AF98920E0E55 var0;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTBGeoPushLocationWrapper;
  result = -[CTBGeoPushLocationWrapper init](&v6, sel_init);
  if (result)
  {
    var0 = a3->var0;
    result->_wrapped.__engaged_ = a3->__engaged_;
    result->_wrapped.var0 = var0;
  }
  return result;
}

- (optional<ctb::GeoPushLocation>)wrapped
{
  *retstr = *(optional<ctb::GeoPushLocation> *)((char *)self + 8);
  return self;
}

- (id).cxx_construct
{
  *((_BYTE *)self + 8) = 0;
  *((_BYTE *)self + 24) = 0;
  return self;
}

@end
