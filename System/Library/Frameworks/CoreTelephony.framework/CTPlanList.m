@implementation CTPlanList

- (CTPlanList)initWithPlans:(id)a3
{
  id v5;
  CTPlanList *v6;
  CTPlanList *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CTPlanList;
  v6 = -[CTPlanList init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_plans, a3);

  return v7;
}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", plans=%@"), self->_plans);
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTPlanList *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (CTPlanList *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTPlanList plans](self, "plans");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTPlanList plans](v4, "plans");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
      {
        v9 = 1;
      }
      else
      {
        -[CTPlanList plans](self, "plans");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTPlanList plans](v4, "plans");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v7, "isEqual:", v8);

      }
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTPlanList)initWithCoder:(id)a3
{
  id v4;
  CTPlanList *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *plans;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTPlanList;
  v5 = -[CTPlanList init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("plans"));
    v9 = objc_claimAutoreleasedReturnValue();
    plans = v5->_plans;
    v5->_plans = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_plans, CFSTR("plans"));
}

- (NSArray)plans
{
  return self->_plans;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plans, 0);
}

@end
