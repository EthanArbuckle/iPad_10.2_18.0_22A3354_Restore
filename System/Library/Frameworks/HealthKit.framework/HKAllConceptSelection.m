@implementation HKAllConceptSelection

- (HKAllConceptSelection)initWithValue:(BOOL)a3
{
  HKAllConceptSelection *v4;
  HKAllConceptSelection *v5;
  HKAllConceptSelection *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKAllConceptSelection;
  v4 = -[HKConceptSelection init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_value = a3;
    v6 = v4;
  }

  return v5;
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKAllConceptSelection)initWithCoder:(id)a3
{
  return -[HKAllConceptSelection initWithValue:](self, "initWithValue:", objc_msgSend(a3, "decodeBoolForKey:", CFSTR("ValueKey")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_value, CFSTR("ValueKey"));
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  char v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HKAllConceptSelection;
  if (-[HKConceptSelection isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[HKAllConceptSelection value](self, "value");
    v7 = objc_msgSend(v5, "value");

    v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)value
{
  return self->_value;
}

@end
