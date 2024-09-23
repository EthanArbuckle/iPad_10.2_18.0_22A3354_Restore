@implementation DNDModeAssertionScheduleLifetime

- (DNDModeAssertionScheduleLifetime)initWithScheduleIdentifier:(id)a3 behavior:(unint64_t)a4
{
  id v6;
  DNDModeAssertionScheduleLifetime *v7;
  uint64_t v8;
  NSString *scheduleIdentifier;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)DNDModeAssertionScheduleLifetime;
  v7 = -[DNDModeAssertionLifetime _init](&v11, sel__init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    scheduleIdentifier = v7->_scheduleIdentifier;
    v7->_scheduleIdentifier = (NSString *)v8;

    v7->_behavior = a4;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[DNDModeAssertionScheduleLifetime scheduleIdentifier](self, "scheduleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[DNDModeAssertionScheduleLifetime lifetimeType](self, "lifetimeType") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  DNDModeAssertionScheduleLifetime *v8;
  DNDModeAssertionScheduleLifetime *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  unint64_t v15;

  v8 = (DNDModeAssertionScheduleLifetime *)a3;
  if (self == v8)
  {
    v14 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = v8;
      -[DNDModeAssertionScheduleLifetime scheduleIdentifier](self, "scheduleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDModeAssertionScheduleLifetime scheduleIdentifier](v9, "scheduleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 != v11)
      {
        -[DNDModeAssertionScheduleLifetime scheduleIdentifier](self, "scheduleIdentifier");
        v12 = objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v14 = 0;
          goto LABEL_15;
        }
        v3 = (void *)v12;
        -[DNDModeAssertionScheduleLifetime scheduleIdentifier](v9, "scheduleIdentifier");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v14 = 0;
          goto LABEL_14;
        }
        v4 = (void *)v13;
        -[DNDModeAssertionScheduleLifetime scheduleIdentifier](self, "scheduleIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDModeAssertionScheduleLifetime scheduleIdentifier](v9, "scheduleIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "isEqual:", v6))
        {
          v14 = 0;
LABEL_11:

LABEL_14:
          goto LABEL_15;
        }
      }
      v15 = -[DNDModeAssertionScheduleLifetime behavior](self, "behavior");
      v14 = v15 == -[DNDModeAssertionScheduleLifetime behavior](v9, "behavior");
      if (v10 != v11)
        goto LABEL_11;
LABEL_15:

      goto LABEL_16;
    }
    v14 = 0;
  }
LABEL_16:

  return v14;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[DNDModeAssertionScheduleLifetime scheduleIdentifier](self, "scheduleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  DNDStringFromModeAssertionScheduleLifetimeBehavior(-[DNDModeAssertionScheduleLifetime behavior](self, "behavior"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; scheduleIdentifier: '%@'; behavior: %@>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)lifetimeType
{
  return 4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DNDModeAssertionScheduleLifetime)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  DNDModeAssertionScheduleLifetime *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("scheduleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("behavior"));

  v7 = -[DNDModeAssertionScheduleLifetime initWithScheduleIdentifier:behavior:](self, "initWithScheduleIdentifier:behavior:", v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[DNDModeAssertionScheduleLifetime scheduleIdentifier](self, "scheduleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("scheduleIdentifier"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[DNDModeAssertionScheduleLifetime behavior](self, "behavior"), CFSTR("behavior"));
}

- (NSString)scheduleIdentifier
{
  return self->_scheduleIdentifier;
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduleIdentifier, 0);
}

@end
