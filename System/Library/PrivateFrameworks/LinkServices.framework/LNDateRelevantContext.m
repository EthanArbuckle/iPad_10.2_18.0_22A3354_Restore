@implementation LNDateRelevantContext

- (LNDateRelevantContext)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v8;
  id v9;
  id *v10;
  LNDateRelevantContext *v11;
  LNDateRelevantContext *v12;
  void *v14;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNRelevantContext.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));

  }
  v15.receiver = self;
  v15.super_class = (Class)LNDateRelevantContext;
  v10 = -[LNRelevantContext _init](&v15, sel__init);
  v11 = (LNDateRelevantContext *)v10;
  if (v10)
  {
    objc_storeStrong(v10 + 1, a3);
    objc_storeStrong((id *)&v11->_endDate, a4);
    v12 = v11;
  }

  return v11;
}

- (LNDateRelevantContext)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  LNDateRelevantContext *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[LNDateRelevantContext initWithStartDate:endDate:](self, "initWithStartDate:endDate:", v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
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

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSDate hash](self->_startDate, "hash");
  return -[NSDate hash](self->_endDate, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  LNDateRelevantContext *v4;
  LNDateRelevantContext *v5;
  NSDate *startDate;
  NSDate *endDate;
  BOOL v8;

  v4 = (LNDateRelevantContext *)a3;
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

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  -[LNDateRelevantContext endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0CB3940];
  -[LNDateRelevantContext startDate](self, "startDate");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v3)
  {
    -[LNDateRelevantContext endDate](self, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<date range: %@ to %@>"), v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<date: %@>"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)analyticsDescription
{
  void *v2;
  __CFString *v3;
  __CFString *v4;

  -[LNDateRelevantContext endDate](self, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = CFSTR(".date(from:to:)");
  else
    v3 = CFSTR(".date()");
  v4 = v3;

  return v4;
}

- (id)asCondition
{
  LNDateRelevantCondition *v3;
  void *v4;
  void *v5;
  LNDateRelevantCondition *v6;

  v3 = [LNDateRelevantCondition alloc];
  -[LNDateRelevantContext startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[LNDateRelevantContext endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LNDateRelevantCondition initWithStartDate:endDate:](v3, "initWithStartDate:endDate:", v4, v5);

  return v6;
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
