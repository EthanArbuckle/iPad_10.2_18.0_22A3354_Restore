@implementation LNLocationRelevantContext

- (LNLocationRelevantContext)initWithRegion:(id)a3
{
  id v6;
  id *v7;
  LNLocationRelevantContext *v8;
  LNLocationRelevantContext *v9;
  void *v11;
  objc_super v12;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNRelevantContext.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("region"));

  }
  v12.receiver = self;
  v12.super_class = (Class)LNLocationRelevantContext;
  v7 = -[LNRelevantContext _init](&v12, sel__init);
  v8 = (LNLocationRelevantContext *)v7;
  if (v7)
  {
    objc_storeStrong(v7 + 1, a3);
    v9 = v8;
  }

  return v8;
}

- (LNLocationRelevantContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  LNLocationRelevantContext *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("region"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNLocationRelevantContext initWithRegion:](self, "initWithRegion:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_region, CFSTR("region"));
}

- (unint64_t)hash
{
  return -[CLRegion hash](self->_region, "hash");
}

- (BOOL)isEqual:(id)a3
{
  LNLocationRelevantContext *v4;
  LNLocationRelevantContext *v5;
  CLRegion *region;
  BOOL v7;

  v4 = (LNLocationRelevantContext *)a3;
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

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[LNLocationRelevantContext region](self, "region");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<location: %@>"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)analyticsDescription
{
  return CFSTR(".location()");
}

- (id)asCondition
{
  LNLocationRelevantCondition *v3;
  void *v4;
  LNLocationRelevantCondition *v5;

  v3 = [LNLocationRelevantCondition alloc];
  -[LNLocationRelevantContext region](self, "region");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[LNLocationRelevantCondition initWithRegion:](v3, "initWithRegion:", v4);

  return v5;
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
