@implementation CTCellularPlanSubscriptionDataUsage

- (CTCellularPlanSubscriptionDataUsage)initWithCategory:(id)a3 andDataUsed:(double)a4 andDataCapacity:(double)a5
{
  id v9;
  CTCellularPlanSubscriptionDataUsage *v10;
  CTCellularPlanSubscriptionDataUsage *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTCellularPlanSubscriptionDataUsage;
  v10 = -[CTCellularPlanSubscriptionDataUsage init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_dataCategory, a3);
    v11->_dataUsed = a4;
    v11->_dataCapacity = a5;
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  v5 = (void *)-[NSString copy](self->_dataCategory, "copy");
  v6 = (void *)objc_msgSend(v4, "initWithCategory:andDataUsed:andDataCapacity:", v5, (double)(uint64_t)self->_dataUsed, (double)(uint64_t)self->_dataCapacity);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CTCellularPlanSubscriptionDataUsage)initWithCoder:(id)a3
{
  id v4;
  CTCellularPlanSubscriptionDataUsage *v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  uint64_t v10;
  NSString *dataCategory;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CTCellularPlanSubscriptionDataUsage;
  v5 = -[CTCellularPlanSubscriptionDataUsage init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataUsed"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v5->_dataUsed = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataCapacity"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "doubleValue");
    v5->_dataCapacity = v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataCategory"));
    v10 = objc_claimAutoreleasedReturnValue();
    dataCategory = v5->_dataCategory;
    v5->_dataCategory = (NSString *)v10;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  double dataUsed;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  dataUsed = self->_dataUsed;
  v8 = a3;
  objc_msgSend(v4, "numberWithDouble:", dataUsed);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("dataUsed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_dataCapacity);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("dataCapacity"));

  objc_msgSend(v8, "encodeObject:forKey:", self->_dataCategory, CFSTR("dataCategory"));
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>\ncategory:%@, (%f bytes / %f bytes) >\n"), v5, self, self->_dataCategory, *(_QWORD *)&self->_dataUsed, *(_QWORD *)&self->_dataCapacity);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)dataUsed
{
  return self->_dataUsed;
}

- (double)dataCapacity
{
  return self->_dataCapacity;
}

- (NSString)dataCategory
{
  return self->_dataCategory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataCategory, 0);
}

@end
