@implementation IDSOffGridDeliveryQueryOptions

+ (id)cached
{
  return -[IDSOffGridDeliveryQueryOptions initWithCached:]([IDSOffGridDeliveryQueryOptions alloc], "initWithCached:", 1);
}

- (IDSOffGridDeliveryQueryOptions)init
{
  IDSOffGridDeliveryQueryOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)IDSOffGridDeliveryQueryOptions;
  result = -[IDSOffGridDeliveryQueryOptions init](&v3, sel_init);
  if (result)
    result->_cached = 0;
  return result;
}

- (IDSOffGridDeliveryQueryOptions)initWithCached:(BOOL)a3
{
  IDSOffGridDeliveryQueryOptions *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IDSOffGridDeliveryQueryOptions;
  result = -[IDSOffGridDeliveryQueryOptions init](&v5, sel_init);
  if (result)
    result->_cached = a3;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IDSOffGridDeliveryQueryOptions)initWithCoder:(id)a3
{
  IDSOffGridDeliveryQueryOptions *v4;

  v4 = -[IDSOffGridDeliveryQueryOptions initWithCached:]([IDSOffGridDeliveryQueryOptions alloc], "initWithCached:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("cached")));

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[IDSOffGridDeliveryQueryOptions cached](self, "cached"), CFSTR("cached"));

}

- (BOOL)cached
{
  return self->_cached;
}

- (void)setCached:(BOOL)a3
{
  self->_cached = a3;
}

@end
