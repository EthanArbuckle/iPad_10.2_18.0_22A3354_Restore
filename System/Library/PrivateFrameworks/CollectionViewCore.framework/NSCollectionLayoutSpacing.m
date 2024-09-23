@implementation NSCollectionLayoutSpacing

+ (NSCollectionLayoutSpacing)fixedSpacing:(CGFloat)fixedSpacing
{
  return (NSCollectionLayoutSpacing *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSpacing:isFlexible:", 0, fixedSpacing);
}

- (NSCollectionLayoutSpacing)initWithSpacing:(double)a3 isFlexible:(BOOL)a4
{
  NSCollectionLayoutSpacing *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NSCollectionLayoutSpacing;
  result = -[NSCollectionLayoutSpacing init](&v7, sel_init);
  if (result)
  {
    result->_spacing = a3;
    result->_isFlexible = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  -[NSCollectionLayoutSpacing spacing](self, "spacing");
  return (id)objc_msgSend(v4, "initWithSpacing:isFlexible:", -[NSCollectionLayoutSpacing isFlexibleSpacing](self, "isFlexibleSpacing"), v5);
}

- (BOOL)isEqual:(id)a3
{
  NSCollectionLayoutSpacing *v4;
  _BOOL4 v5;
  BOOL v6;
  double v7;
  double v8;
  double v9;

  v4 = (NSCollectionLayoutSpacing *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = -[NSCollectionLayoutSpacing isFlexibleSpacing](self, "isFlexibleSpacing");
    if (v5 == -[NSCollectionLayoutSpacing isFlexibleSpacing](v4, "isFlexibleSpacing"))
    {
      -[NSCollectionLayoutSpacing spacing](self, "spacing");
      v8 = v7;
      -[NSCollectionLayoutSpacing spacing](v4, "spacing");
      v6 = vabdd_f64(v8, v9) <= 0.00001;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (BOOL)isFlexibleSpacing
{
  return self->_isFlexible;
}

- (CGFloat)spacing
{
  return self->_spacing;
}

- (BOOL)_hasSpacing
{
  return self->_isFlexible || self->_spacing > 0.0;
}

- (id)_externalDescription
{
  _BOOL4 isFlexible;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  isFlexible = self->_isFlexible;
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_spacing);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (isFlexible)
    v6 = CFSTR(".flexible(%@)");
  else
    v6 = CFSTR(".fixed(%@)");
  objc_msgSend(v3, "stringWithFormat:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)defaultSpacing
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithSpacing:isFlexible:", 0, 0.0);
}

+ (NSCollectionLayoutSpacing)flexibleSpacing:(CGFloat)flexibleSpacing
{
  return (NSCollectionLayoutSpacing *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithSpacing:isFlexible:", 1, flexibleSpacing);
}

- (id)description
{
  _BOOL4 isFlexible;
  void *v4;
  objc_class *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  isFlexible = self->_isFlexible;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_spacing);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (isFlexible)
    v9 = CFSTR("<%@ - %p: flexible:%@>");
  else
    v9 = CFSTR("<%@ - %p: fixed:%@>");
  objc_msgSend(v4, "stringWithFormat:", v9, v6, self, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isFixedSpacing
{
  return !self->_isFlexible;
}

@end
