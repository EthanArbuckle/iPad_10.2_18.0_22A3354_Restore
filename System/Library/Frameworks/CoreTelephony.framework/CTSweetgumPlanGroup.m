@implementation CTSweetgumPlanGroup

- (CTSweetgumPlanGroup)init
{
  CTSweetgumPlanGroup *v2;
  CTSweetgumPlanGroup *v3;
  NSArray *plans;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTSweetgumPlanGroup;
  v2 = -[CTSweetgumPlanGroup init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    plans = v2->_plans;
    v2->_planCategory = 0;
    v2->_plans = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", planCategory=%s"), CTSweetgumPlanCategoryAsString(-[CTSweetgumPlanGroup planCategory](self, "planCategory")));
  -[CTSweetgumPlanGroup plans](self, "plans");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", plans=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTSweetgumPlanGroup *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (CTSweetgumPlanGroup *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v5 = -[CTSweetgumPlanGroup planCategory](self, "planCategory"),
          v5 == -[CTSweetgumPlanGroup planCategory](v4, "planCategory")))
    {
      -[CTSweetgumPlanGroup plans](self, "plans");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTSweetgumPlanGroup plans](v4, "plans");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[CTSweetgumPlanGroup plans](self, "plans");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSweetgumPlanGroup plans](v4, "plans");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToArray:", v9);

      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t planCategory;
  id v5;

  planCategory = self->_planCategory;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", planCategory, CFSTR("planCategory"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_plans, CFSTR("plans"));

}

- (CTSweetgumPlanGroup)initWithCoder:(id)a3
{
  id v4;
  CTSweetgumPlanGroup *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *plans;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTSweetgumPlanGroup;
  v5 = -[CTSweetgumPlanGroup init](&v12, sel_init);
  if (v5)
  {
    v5->_planCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("planCategory"));
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

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)planCategory
{
  return self->_planCategory;
}

- (void)setPlanCategory:(int64_t)a3
{
  self->_planCategory = a3;
}

- (NSArray)plans
{
  return self->_plans;
}

- (void)setPlans:(id)a3
{
  objc_storeStrong((id *)&self->_plans, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_plans, 0);
}

@end
