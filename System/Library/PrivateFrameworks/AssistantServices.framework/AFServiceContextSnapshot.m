@implementation AFServiceContextSnapshot

- (AFServiceContextSnapshot)initWithDeliveryDate:(id)a3
{
  id v4;
  AFServiceContextSnapshot *v5;
  uint64_t v6;
  NSDate *deliveryDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFServiceContextSnapshot;
  v5 = -[AFServiceContextSnapshot init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    deliveryDate = v5->_deliveryDate;
    v5->_deliveryDate = (NSDate *)v6;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)AFServiceContextSnapshot;
  -[AFServiceContextSnapshot description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, deliveryDate: %@"), v4, self->_deliveryDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  AFServiceContextSnapshot *v4;
  AFServiceContextSnapshot *v5;
  NSDate *deliveryDate;
  NSDate *v7;
  NSDate *v8;
  void *v9;
  char v10;

  v4 = (AFServiceContextSnapshot *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      deliveryDate = self->_deliveryDate;
      -[AFServiceContextSnapshot deliveryDate](v5, "deliveryDate");
      v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
      if (deliveryDate == v7)
      {
        v10 = 1;
      }
      else
      {
        v8 = self->_deliveryDate;
        -[AFServiceContextSnapshot deliveryDate](v5, "deliveryDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[NSDate isEqual:](v8, "isEqual:", v9);

      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  return -[NSDate hash](self->_deliveryDate, "hash");
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_deliveryDate, CFSTR("_deliveryDate"));
}

- (AFServiceContextSnapshot)initWithCoder:(id)a3
{
  id v4;
  AFServiceContextSnapshot *v5;
  uint64_t v6;
  NSDate *deliveryDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFServiceContextSnapshot;
  v5 = -[AFServiceContextSnapshot init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_deliveryDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    deliveryDate = v5->_deliveryDate;
    v5->_deliveryDate = (NSDate *)v6;

  }
  return v5;
}

- (NSDate)deliveryDate
{
  return self->_deliveryDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deliveryDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
