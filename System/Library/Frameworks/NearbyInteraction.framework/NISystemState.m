@implementation NISystemState

- (NISystemState)init
{
  NISystemState *v3;

  v3 = -[NISystemState initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:]([NISystemState alloc], "initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:", 0, 0);

  return v3;
}

- (NISystemState)initWithUWBPreciseDistanceAvailability:(unint64_t)a3 uwbExtendedDistanceAvailability:(unint64_t)a4
{
  NISystemState *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NISystemState;
  result = -[NISystemState init](&v7, sel_init);
  if (result)
  {
    result->_uwbPreciseDistanceAvailability = a3;
    result->_uwbExtendedDistanceAvailability = a4;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[NISystemState initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:](+[NISystemState allocWithZone:](NISystemState, "allocWithZone:", a3), "initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:", self->_uwbPreciseDistanceAvailability, self->_uwbExtendedDistanceAvailability);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", self->_uwbPreciseDistanceAvailability, CFSTR("uwbPreciseDistanceAvailability"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_uwbExtendedDistanceAvailability, CFSTR("uwbExtendedDistanceAvailability"));

}

- (NISystemState)initWithCoder:(id)a3
{
  id v4;
  NISystemState *v5;

  v4 = a3;
  v5 = -[NISystemState initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:]([NISystemState alloc], "initWithUWBPreciseDistanceAvailability:uwbExtendedDistanceAvailability:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("uwbPreciseDistanceAvailability")), objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("uwbExtendedDistanceAvailability")));

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NISystemState *v5;
  NISystemState *v6;
  uint64_t v7;
  unint64_t uwbPreciseDistanceAvailability;
  uint64_t v9;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (NISystemState *)v4;
    v6 = v5;
    if (v5 == self)
    {
      v11 = 1;
    }
    else
    {
      v7 = -[NISystemState uwbPreciseDistanceAvailability](v5, "uwbPreciseDistanceAvailability");
      uwbPreciseDistanceAvailability = self->_uwbPreciseDistanceAvailability;
      v9 = -[NISystemState uwbExtendedDistanceAvailability](v6, "uwbExtendedDistanceAvailability");
      v11 = v7 == uwbPreciseDistanceAvailability && v9 == self->_uwbExtendedDistanceAvailability;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  return self->_uwbPreciseDistanceAvailability ^ self->_uwbExtendedDistanceAvailability ^ 0x1F;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NISystemState descriptionInternal](self, "descriptionInternal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %@>"), v5, v6);

  return v7;
}

- (id)descriptionInternal
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[NIUtils NISystemResourceAvailabilityToString:](NIUtils, "NISystemResourceAvailabilityToString:", self->_uwbPreciseDistanceAvailability);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NIUtils NISystemResourceAvailabilityToString:](NIUtils, "NISystemResourceAvailabilityToString:", self->_uwbExtendedDistanceAvailability);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<UWB [precise distance: %@, extended distance: %@]>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)uwbPreciseDistanceAvailability
{
  return self->_uwbPreciseDistanceAvailability;
}

- (void)setUwbPreciseDistanceAvailability:(unint64_t)a3
{
  self->_uwbPreciseDistanceAvailability = a3;
}

- (unint64_t)uwbExtendedDistanceAvailability
{
  return self->_uwbExtendedDistanceAvailability;
}

- (void)setUwbExtendedDistanceAvailability:(unint64_t)a3
{
  self->_uwbExtendedDistanceAvailability = a3;
}

@end
