@implementation BSOpaqueWrapper

+ (id)wrapperFor:(id)a3
{
  id v3;
  BSOpaqueWrapper *v4;

  v3 = a3;
  v4 = -[BSOpaqueWrapper initWithThing:]([BSOpaqueWrapper alloc], "initWithThing:", v3);

  return v4;
}

- (BSOpaqueWrapper)initWithThing:(id)a3
{
  id v4;
  BSOpaqueWrapper *v5;
  _BSOpaqueWrapper *v6;
  _BSOpaqueWrapper *opaqueWrapper;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSOpaqueWrapper;
  v5 = -[BSOpaqueWrapper init](&v9, sel_init);
  if (v5)
  {
    v6 = -[_BSOpaqueWrapper init:]([_BSOpaqueWrapper alloc], "init:", v4);
    opaqueWrapper = v5->_opaqueWrapper;
    v5->_opaqueWrapper = v6;

  }
  return v5;
}

- (id)wrappedThing
{
  if (self)
    self = (BSOpaqueWrapper *)self->_opaqueWrapper;
  return -[BSOpaqueWrapper wrappedThing](self, "wrappedThing");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opaqueWrapper, 0);
}

@end
