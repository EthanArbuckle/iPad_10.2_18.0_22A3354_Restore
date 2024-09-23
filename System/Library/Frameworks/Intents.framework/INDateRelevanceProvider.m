@implementation INDateRelevanceProvider

- (INDateRelevanceProvider)initWithStartDate:(NSDate *)startDate endDate:(NSDate *)endDate
{
  NSDate *v7;
  NSDate *v8;
  id *v9;
  INDateRelevanceProvider *v10;
  INDateRelevanceProvider *v11;
  objc_super v13;

  v7 = startDate;
  v8 = endDate;
  v13.receiver = self;
  v13.super_class = (Class)INDateRelevanceProvider;
  v9 = -[INRelevanceProvider _init](&v13, sel__init);
  v10 = (INDateRelevanceProvider *)v9;
  if (v9)
  {
    objc_storeStrong(v9 + 1, startDate);
    objc_storeStrong((id *)&v10->_endDate, endDate);
    v11 = v10;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *startDate;
  id v5;

  startDate = self->_startDate;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));

}

- (INDateRelevanceProvider)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  INDateRelevanceProvider *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[INDateRelevanceProvider initWithStartDate:endDate:](self, "initWithStartDate:endDate:", v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDate hash](self->_startDate, "hash");
  return -[NSDate hash](self->_endDate, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  INDateRelevanceProvider *v4;
  INDateRelevanceProvider *v5;
  NSDate *startDate;
  NSDate *endDate;
  BOOL v8;

  v4 = (INDateRelevanceProvider *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      startDate = self->_startDate;
      v8 = 0;
      if (startDate == v5->_startDate || -[NSDate isEqual:](startDate, "isEqual:"))
      {
        endDate = self->_endDate;
        if (endDate == v5->_endDate || -[NSDate isEqual:](endDate, "isEqual:"))
          v8 = 1;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
