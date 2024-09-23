@implementation ResourceUsageLocation

- (ResourceUsageLocation)initWithCoder:(id)a3
{
  id v4;
  ResourceUsageLocation *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ResourceUsageLocation;
  v5 = -[ResourceUsageLocation init](&v7, "init");
  if (v5)
  {
    v5->_functionIndex = (unint64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("functionIndex"));
    v5->_subCommandIndex = (int64_t)objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("subCommandIndex"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt64:forKey:", self->_functionIndex, CFSTR("functionIndex"));
  objc_msgSend(v4, "encodeInt64:forKey:", self->_subCommandIndex, CFSTR("subCommandIndex"));

}

- (BOOL)isEqualTo:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  BOOL v10;

  v4 = a3;
  v6 = objc_opt_class(ResourceUsageLocation, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = v4;
    v8 = -[ResourceUsageLocation functionIndex](self, "functionIndex");
    if (v8 == objc_msgSend(v7, "functionIndex"))
    {
      v9 = -[ResourceUsageLocation subCommandIndex](self, "subCommandIndex");
      v10 = v9 == objc_msgSend(v7, "subCommandIndex");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[ResourceUsageLocation functionIndex](self, "functionIndex");
  return -[ResourceUsageLocation subCommandIndex](self, "subCommandIndex") | (v3 << 32);
}

- (id)copyWithZone:(_NSZone *)a3
{
  ResourceUsageLocation *v4;

  v4 = objc_alloc_init(ResourceUsageLocation);
  -[ResourceUsageLocation setFunctionIndex:](v4, "setFunctionIndex:", self->_functionIndex);
  -[ResourceUsageLocation setSubCommandIndex:](v4, "setSubCommandIndex:", self->_subCommandIndex);
  return v4;
}

- (unint64_t)functionIndex
{
  return self->_functionIndex;
}

- (void)setFunctionIndex:(unint64_t)a3
{
  self->_functionIndex = a3;
}

- (int64_t)subCommandIndex
{
  return self->_subCommandIndex;
}

- (void)setSubCommandIndex:(int64_t)a3
{
  self->_subCommandIndex = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
