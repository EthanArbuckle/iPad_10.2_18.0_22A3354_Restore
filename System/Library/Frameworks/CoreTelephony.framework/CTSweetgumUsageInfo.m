@implementation CTSweetgumUsageInfo

- (CTSweetgumUsageInfo)init
{
  CTSweetgumUsageInfo *v2;
  CTSweetgumUsageInfo *v3;
  NSArray *accountMetrics;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CTSweetgumUsageInfo;
  v2 = -[CTSweetgumUsageInfo init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    accountMetrics = v2->_accountMetrics;
    v2->_accountMetrics = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTSweetgumUsageInfo accountMetrics](self, "accountMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" accountMetrics=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTSweetgumUsageInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (CTSweetgumUsageInfo *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTSweetgumUsageInfo accountMetrics](self, "accountMetrics");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTSweetgumUsageInfo accountMetrics](v4, "accountMetrics");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
      {
        v9 = 1;
      }
      else
      {
        -[CTSweetgumUsageInfo accountMetrics](self, "accountMetrics");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTSweetgumUsageInfo accountMetrics](v4, "accountMetrics");
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

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_accountMetrics, CFSTR("account_metrics"));
}

- (CTSweetgumUsageInfo)initWithCoder:(id)a3
{
  id v4;
  CTSweetgumUsageInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *accountMetrics;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTSweetgumUsageInfo;
  v5 = -[CTSweetgumUsageInfo init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("account_metrics"));
    v9 = objc_claimAutoreleasedReturnValue();
    accountMetrics = v5->_accountMetrics;
    v5->_accountMetrics = (NSArray *)v9;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)accountMetrics
{
  return self->_accountMetrics;
}

- (void)setAccountMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_accountMetrics, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountMetrics, 0);
}

@end
