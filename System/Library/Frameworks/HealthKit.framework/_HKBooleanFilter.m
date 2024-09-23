@implementation _HKBooleanFilter

- (_HKBooleanFilter)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (_HKBooleanFilter)initWithValue:(BOOL)a3
{
  _HKBooleanFilter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKBooleanFilter;
  result = -[_HKBooleanFilter init](&v5, sel_init);
  if (result)
    result->_value = a3;
  return result;
}

+ (_HKBooleanFilter)trueFilter
{
  return -[_HKBooleanFilter initWithValue:]([_HKBooleanFilter alloc], "initWithValue:", 1);
}

+ (_HKBooleanFilter)falseFilter
{
  return -[_HKBooleanFilter initWithValue:]([_HKBooleanFilter alloc], "initWithValue:", 0);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  HKStringFromBool(self->_value);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)acceptsDataObject:(id)a3
{
  return self->_value;
}

- (int64_t)acceptsActivitySummary:(id)a3
{
  return self->_value;
}

- (int64_t)acceptsDataObjectWithStartTimestamp:(double)a3 endTimestamp:(double)a4 valueInCanonicalUnit:(double)a5
{
  return self->_value;
}

- (BOOL)acceptsWorkoutActivity:(id)a3
{
  return self->_value;
}

- (BOOL)isEqual:(id)a3
{
  _HKBooleanFilter *v4;
  BOOL v5;

  v4 = (_HKBooleanFilter *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_value == v4->_value;
  }

  return v5;
}

- (unint64_t)hash
{
  return self->_value;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HKBooleanFilter)initWithCoder:(id)a3
{
  return -[_HKBooleanFilter initWithValue:](self, "initWithValue:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("value")));
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKBooleanFilter;
  v4 = a3;
  -[_HKFilter encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeBool:forKey:", self->_value, CFSTR("value"), v5.receiver, v5.super_class);

}

- (BOOL)value
{
  return self->_value;
}

@end
