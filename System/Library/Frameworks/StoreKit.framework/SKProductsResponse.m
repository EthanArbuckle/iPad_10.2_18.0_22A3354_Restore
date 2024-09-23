@implementation SKProductsResponse

- (SKProductsResponse)init
{
  SKProductsResponse *v2;
  SKProductsResponseInternal *v3;
  id internal;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKProductsResponse;
  v2 = -[SKProductsResponse init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SKProductsResponseInternal);
    internal = v2->_internal;
    v2->_internal = v3;

  }
  return v2;
}

- (NSArray)invalidProductIdentifiers
{
  return (NSArray *)*((id *)self->_internal + 1);
}

- (NSArray)products
{
  return (NSArray *)*((id *)self->_internal + 2);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_internal, 0);
}

- (void)_setInvalidIdentifiers:(id)a3
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->_internal;
  if ((id)internal[1] != a3)
  {
    v7 = internal;
    v5 = objc_msgSend(a3, "copy");
    v6 = (void *)internal[1];
    internal[1] = v5;

  }
}

- (void)_setProducts:(id)a3
{
  _QWORD *internal;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  internal = self->_internal;
  if ((id)internal[2] != a3)
  {
    v7 = internal;
    v5 = objc_msgSend(a3, "copy");
    v6 = (void *)internal[2];
    internal[2] = v5;

  }
}

@end
