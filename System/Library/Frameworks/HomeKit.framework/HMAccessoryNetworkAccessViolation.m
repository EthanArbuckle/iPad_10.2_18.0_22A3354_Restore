@implementation HMAccessoryNetworkAccessViolation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HMAccessoryNetworkAccessViolation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMAccessoryNetworkAccessViolation *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMANAV.lastOccurrenceDate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("HMANAV.lastResetDate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[HMAccessoryNetworkAccessViolation initWithLastViolationDate:lastViolationResetDate:](self, "initWithLastViolationDate:lastViolationResetDate:", v5, v6);
  return v7;
}

- (HMAccessoryNetworkAccessViolation)initWithLastViolationDate:(id)a3 lastViolationResetDate:(id)a4
{
  id v7;
  id v8;
  HMAccessoryNetworkAccessViolation *v9;
  HMAccessoryNetworkAccessViolation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMAccessoryNetworkAccessViolation;
  v9 = -[HMAccessoryNetworkAccessViolation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lastViolationDate, a3);
    objc_storeStrong((id *)&v10->_lastResetDate, a4);
  }

  return v10;
}

- (BOOL)hasCurrentViolation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[HMAccessoryNetworkAccessViolation lastViolationDate](self, "lastViolationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[HMAccessoryNetworkAccessViolation lastResetDate](self, "lastResetDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 1;
  -[HMAccessoryNetworkAccessViolation lastViolationDate](self, "lastViolationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMAccessoryNetworkAccessViolation lastResetDate](self, "lastResetDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6) == 1;

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMAccessoryNetworkAccessViolation lastViolationDate](self, "lastViolationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMAccessoryNetworkAccessViolation lastResetDate](self, "lastResetDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessoryNetworkAccessViolation *v4;
  HMAccessoryNetworkAccessViolation *v5;
  HMAccessoryNetworkAccessViolation *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;

  v4 = (HMAccessoryNetworkAccessViolation *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6
      && (-[HMAccessoryNetworkAccessViolation lastViolationDate](self, "lastViolationDate"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[HMAccessoryNetworkAccessViolation lastViolationDate](v6, "lastViolationDate"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = HMFEqualObjects(),
          v8,
          v7,
          v9))
    {
      -[HMAccessoryNetworkAccessViolation lastResetDate](self, "lastResetDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMAccessoryNetworkAccessViolation lastResetDate](v6, "lastResetDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = HMFEqualObjects();

    }
    else
    {
      v12 = 0;
    }

  }
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99768];
  v7 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ is unavailable"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v9, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v10);
}

- (NSDate)lastViolationDate
{
  return (NSDate *)objc_getProperty(self, a2, 8, 1);
}

- (NSDate)lastResetDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastResetDate, 0);
  objc_storeStrong((id *)&self->_lastViolationDate, 0);
}

@end
