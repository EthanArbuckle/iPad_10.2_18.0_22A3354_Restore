@implementation HKMHDomainSummary

- (HKMHDomainSummary)initWithDomains:(id)a3 count:(int64_t)a4 totalSampleCount:(int64_t)a5
{
  id v9;
  HKMHDomainSummary *v10;
  HKMHDomainSummary *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKMHDomainSummary;
  v10 = -[HKMHDomainSummary init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_domains, a3);
    v11->_count = a4;
    v11->_totalSampleCount = a5;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  BOOL v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[NSArray isEqualToArray:](self->_domains, "isEqualToArray:", v5[1])
      && self->_count == v5[2]
      && self->_totalSampleCount == v5[3];

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_count ^ self->_totalSampleCount ^ -[NSArray hash](self->_domains, "hash");
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[NSArray description](self->_domains, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_count);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_totalSampleCount);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p Domains:%@ count:%@ total:%@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHDomainSummary)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  HKMHDomainSummary *v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Count"));
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("Domains"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("TotalSampleCount"));

  v8 = -[HKMHDomainSummary initWithDomains:count:totalSampleCount:](self, "initWithDomains:count:totalSampleCount:", v6, v5, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t count;
  id v5;

  count = self->_count;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", count, CFSTR("Count"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domains, CFSTR("Domains"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_totalSampleCount, CFSTR("TotalSampleCount"));

}

- (NSArray)domains
{
  return self->_domains;
}

- (int64_t)count
{
  return self->_count;
}

- (int64_t)totalSampleCount
{
  return self->_totalSampleCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domains, 0);
}

@end
