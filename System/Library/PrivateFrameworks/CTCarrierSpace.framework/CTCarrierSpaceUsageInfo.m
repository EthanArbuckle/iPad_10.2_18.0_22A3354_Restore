@implementation CTCarrierSpaceUsageInfo

- (CTCarrierSpaceUsageInfo)init
{
  CTCarrierSpaceUsageInfo *v2;
  CTCarrierSpaceUsageInfo *v3;
  NSArray *accountMetrics;
  NSString *moreDetailsURL;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CTCarrierSpaceUsageInfo;
  v2 = -[CTCarrierSpaceUsageInfo init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    accountMetrics = v2->_accountMetrics;
    v2->_accountMetrics = 0;

    moreDetailsURL = v3->_moreDetailsURL;
    v3->_moreDetailsURL = 0;

  }
  return v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCarrierSpaceUsageInfo accountMetrics](self, "accountMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" accountMetrics=%@"), v4);

  -[CTCarrierSpaceUsageInfo moreDetailsURL](self, "moreDetailsURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(", moreDetailsURL=%@"), v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  CTCarrierSpaceUsageInfo *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (CTCarrierSpaceUsageInfo *)a3;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[CTCarrierSpaceUsageInfo accountMetrics](self, "accountMetrics");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCarrierSpaceUsageInfo accountMetrics](v4, "accountMetrics");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 == v6)
      {
        v9 = 1;
      }
      else
      {
        -[CTCarrierSpaceUsageInfo accountMetrics](self, "accountMetrics");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[CTCarrierSpaceUsageInfo accountMetrics](v4, "accountMetrics");
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

- (CTCarrierSpaceUsageInfo)initWithCoder:(id)a3
{
  id v4;
  CTCarrierSpaceUsageInfo *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *accountMetrics;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CTCarrierSpaceUsageInfo;
  v5 = -[CTCarrierSpaceUsageInfo init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
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

- (NSString)moreDetailsURL
{
  return self->_moreDetailsURL;
}

- (void)setMoreDetailsURL:(id)a3
{
  objc_storeStrong((id *)&self->_moreDetailsURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreDetailsURL, 0);
  objc_storeStrong((id *)&self->_accountMetrics, 0);
}

@end
