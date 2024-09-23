@implementation CADChangeTrackingClientId

- (CADChangeTrackingClientId)clientIdWithBundleId:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[CADChangeTrackingClientId hasCustomClientId](self, "hasCustomClientId"))
  {
    -[CADChangeTrackingClientId customClientId](self, "customClientId");
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v7 = v5;
    goto LABEL_7;
  }
  if (!-[CADChangeTrackingClientId hasSuffix](self, "hasSuffix"))
  {
    v5 = v4;
    goto LABEL_6;
  }
  -[CADChangeTrackingClientId suffix](self, "suffix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR("~%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return (CADChangeTrackingClientId *)v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[CADChangeTrackingClientId customClientId](self, "customClientId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ClientId"));

  -[CADChangeTrackingClientId suffix](self, "suffix");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("Suffix"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  if (-[CADChangeTrackingClientId hasCustomClientId](self, "hasCustomClientId"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    -[CADChangeTrackingClientId clientId](self, "clientId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("ClientId: {%@}"), v4);
  }
  else
  {
    if (!-[CADChangeTrackingClientId hasSuffix](self, "hasSuffix"))
    {
      v6 = CFSTR("No Custom ClientID or Suffix");
      return v6;
    }
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[CADChangeTrackingClientId suffix](self, "suffix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("Suffix: {%@}"), v4);
  }
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)hasSuffix
{
  void *v2;
  BOOL v3;

  -[CADChangeTrackingClientId suffix](self, "suffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (NSString)suffix
{
  return self->_suffix;
}

- (BOOL)hasCustomClientId
{
  void *v2;
  BOOL v3;

  -[CADChangeTrackingClientId customClientId](self, "customClientId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (NSString)customClientId
{
  return self->_customClientId;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customClientId, 0);
  objc_storeStrong((id *)&self->_suffix, 0);
}

- (CADChangeTrackingClientId)initWithCoder:(id)a3
{
  id v4;
  CADChangeTrackingClientId *v5;
  uint64_t v6;
  NSString *customClientId;
  uint64_t v8;
  NSString *suffix;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CADChangeTrackingClientId;
  v5 = -[CADChangeTrackingClientId init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ClientId"));
    v6 = objc_claimAutoreleasedReturnValue();
    customClientId = v5->_customClientId;
    v5->_customClientId = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Suffix"));
    v8 = objc_claimAutoreleasedReturnValue();
    suffix = v5->_suffix;
    v5->_suffix = (NSString *)v8;

  }
  return v5;
}

- (CADChangeTrackingClientId)initWithCustomClientId:(id)a3
{
  id v5;
  CADChangeTrackingClientId *v6;
  CADChangeTrackingClientId *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADChangeTrackingClientId;
  v6 = -[CADChangeTrackingClientId init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_customClientId, a3);

  return v7;
}

- (CADChangeTrackingClientId)initWithSuffix:(id)a3
{
  id v5;
  CADChangeTrackingClientId *v6;
  CADChangeTrackingClientId *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CADChangeTrackingClientId;
  v6 = -[CADChangeTrackingClientId init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_suffix, a3);

  return v7;
}

- (id)clientId
{
  void *v3;
  void *v4;

  if (-[CADChangeTrackingClientId hasCustomClientId](self, "hasCustomClientId"))
  {
    -[CADChangeTrackingClientId customClientId](self, "customClientId");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[CADChangeTrackingClientId hasSuffix](self, "hasSuffix"))
  {
    -[CADChangeTrackingClientId suffix](self, "suffix");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("~"), "stringByAppendingString:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)isEqualToChangeTrackingClientId:(id)a3
{
  CADChangeTrackingClientId *v4;
  CADChangeTrackingClientId *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;

  v4 = (CADChangeTrackingClientId *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else if (v4
         && (-[CADChangeTrackingClientId suffix](self, "suffix"),
             v6 = (void *)objc_claimAutoreleasedReturnValue(),
             -[CADChangeTrackingClientId suffix](v5, "suffix"),
             v7 = (void *)objc_claimAutoreleasedReturnValue(),
             v7,
             v6,
             v6 == v7))
  {
    -[CADChangeTrackingClientId customClientId](self, "customClientId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADChangeTrackingClientId customClientId](v5, "customClientId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9 == v10;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  CADChangeTrackingClientId *v4;
  BOOL v5;

  v4 = (CADChangeTrackingClientId *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[CADChangeTrackingClientId isEqualToChangeTrackingClientId:](self, "isEqualToChangeTrackingClientId:", v4);
  }

  return v5;
}

@end
