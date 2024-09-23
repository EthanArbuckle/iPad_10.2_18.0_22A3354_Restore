@implementation INLocationRelevanceProvider

- (INLocationRelevanceProvider)initWithRegion:(CLRegion *)region
{
  CLRegion *v5;
  id *v6;
  INLocationRelevanceProvider *v7;
  INLocationRelevanceProvider *v8;
  objc_super v10;

  v5 = region;
  v10.receiver = self;
  v10.super_class = (Class)INLocationRelevanceProvider;
  v6 = -[INRelevanceProvider _init](&v10, sel__init);
  v7 = (INLocationRelevanceProvider *)v6;
  if (v6)
  {
    objc_storeStrong(v6 + 1, region);
    v8 = v7;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_region, CFSTR("region"));
}

- (INLocationRelevanceProvider)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  INLocationRelevanceProvider *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[INLocationRelevanceProvider initWithRegion:](self, "initWithRegion:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[CLRegion hash](self->_region, "hash");
}

- (BOOL)isEqual:(id)a3
{
  INLocationRelevanceProvider *v4;
  INLocationRelevanceProvider *v5;
  CLRegion *region;
  BOOL v7;

  v4 = (INLocationRelevanceProvider *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      region = self->_region;
      v7 = region == v5->_region || -[CLRegion isEqual:](region, "isEqual:");

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (CLRegion)region
{
  return self->_region;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_region, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
