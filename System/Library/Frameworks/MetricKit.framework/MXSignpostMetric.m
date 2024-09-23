@implementation MXSignpostMetric

- (MXSignpostMetric)initWithSignpostName:(id)a3 withSignpostCategory:(id)a4 withTotalCount:(unint64_t)a5 withSignpostIntervalData:(id)a6
{
  id v11;
  id v12;
  id v13;
  MXSignpostMetric *v14;
  MXSignpostMetric *v15;
  MXSignpostMetric *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)MXSignpostMetric;
  v14 = -[MXMetric init](&v18, sel_init);
  v15 = v14;
  if (!v14)
    goto LABEL_5;
  v16 = 0;
  if (v11 && v12)
  {
    objc_storeStrong((id *)&v14->_signpostName, a3);
    objc_storeStrong((id *)&v15->_signpostCategory, a4);
    v15->_totalCount = a5;
    objc_storeStrong((id *)&v15->_signpostIntervalData, a6);
LABEL_5:
    v16 = v15;
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *signpostName;
  id v5;

  signpostName = self->_signpostName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", signpostName, CFSTR("signpostName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signpostCategory, CFSTR("signpostCategory"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_totalCount, CFSTR("totalSignpostCount"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signpostIntervalData, CFSTR("signpostIntervalData"));

}

- (MXSignpostMetric)initWithCoder:(id)a3
{
  id v4;
  MXSignpostMetric *v5;
  uint64_t v6;
  NSString *signpostName;
  uint64_t v8;
  NSString *signpostCategory;
  uint64_t v10;
  MXSignpostIntervalData *signpostIntervalData;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MXSignpostMetric;
  v5 = -[MXMetric init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signpostName"));
    v6 = objc_claimAutoreleasedReturnValue();
    signpostName = v5->_signpostName;
    v5->_signpostName = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signpostCategory"));
    v8 = objc_claimAutoreleasedReturnValue();
    signpostCategory = v5->_signpostCategory;
    v5->_signpostCategory = (NSString *)v8;

    v5->_totalCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("totalSignpostCount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signpostIntervalData"));
    v10 = objc_claimAutoreleasedReturnValue();
    signpostIntervalData = v5->_signpostIntervalData;
    v5->_signpostIntervalData = (MXSignpostIntervalData *)v10;

  }
  return v5;
}

- (id)toDictionary
{
  id v3;
  void *v4;
  MXSignpostIntervalData *signpostIntervalData;
  void *v6;

  if (self->_signpostName && self->_signpostCategory)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v3, "setObject:forKey:", self->_signpostName, CFSTR("signpostName"));
    objc_msgSend(v3, "setObject:forKey:", self->_signpostCategory, CFSTR("signpostCategory"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_totalCount);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("totalSignpostCount"));

    signpostIntervalData = self->_signpostIntervalData;
    if (signpostIntervalData)
    {
      -[MXSignpostIntervalData toDictionary](signpostIntervalData, "toDictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("signpostIntervalData"));

    }
  }
  else
  {
    v3 = (id)MEMORY[0x24BDBD1B8];
  }
  return v3;
}

- (NSString)signpostName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)signpostCategory
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (MXSignpostIntervalData)signpostIntervalData
{
  return (MXSignpostIntervalData *)objc_getProperty(self, a2, 32, 1);
}

- (NSUInteger)totalCount
{
  return self->_totalCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signpostIntervalData, 0);
  objc_storeStrong((id *)&self->_signpostCategory, 0);
  objc_storeStrong((id *)&self->_signpostName, 0);
}

@end
