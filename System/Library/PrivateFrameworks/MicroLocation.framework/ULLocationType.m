@implementation ULLocationType

- (ULLocationType)initWithLocationTypeEnum:(unint64_t)a3
{
  ULLocationType *v4;
  ULLocationType *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ULLocationType;
  v4 = -[ULLocationType init](&v7, sel_init);
  v5 = v4;
  if (v4)
    -[ULLocationType setLocationType:](v4, "setLocationType:", a3);
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLocationTypeEnum:", self->_locationType);
}

- (void)encodeWithCoder:(id)a3
{
  void *v3;
  unint64_t locationType;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDD16E0];
  locationType = self->_locationType;
  v5 = a3;
  objc_msgSend(v3, "numberWithUnsignedInteger:", locationType);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("locationType"));

}

- (ULLocationType)initWithCoder:(id)a3
{
  id v4;
  ULLocationType *v5;
  ULLocationType *v6;
  ULLocationType *v7;
  unint64_t v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ULLocationType;
  v5 = -[ULLocationType init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationType"));
    v6 = (ULLocationType *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = -[ULLocationType unsignedIntValue](v6, "unsignedIntValue");

      v5->_locationType = v8;
      v7 = v5;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t locationType;
  const __CFString *v8;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: "), v5);

  locationType = self->_locationType;
  if (locationType > 1)
  {
    if (locationType == 2)
    {
      v8 = CFSTR("Custom");
      goto LABEL_11;
    }
    if (locationType == 30)
    {
      v8 = CFSTR("Other");
      goto LABEL_11;
    }
LABEL_8:
    v8 = CFSTR("Unknown");
    goto LABEL_11;
  }
  if (!locationType)
  {
    v8 = CFSTR("Home");
    goto LABEL_11;
  }
  if (locationType != 1)
    goto LABEL_8;
  v8 = CFSTR("Work");
LABEL_11:
  objc_msgSend(v6, "appendFormat:", CFSTR(", locationType: %@"), v8);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[ULLocationType locationType](self, "locationType");
    v7 = objc_msgSend(v5, "locationType");

    v8 = v6 == v7;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  return self->_locationType;
}

- (ULLocationType)init
{
  __assert_rtn("-[ULLocationType init]", "ULConnectionTypes.m", 108, "NO");
}

+ (id)new
{
  __assert_rtn("+[ULLocationType new]", "ULConnectionTypes.m", 113, "NO");
}

- (unint64_t)locationType
{
  return self->_locationType;
}

- (void)setLocationType:(unint64_t)a3
{
  self->_locationType = a3;
}

@end
