@implementation HKMHMostPrevalentDomains

- (HKMHMostPrevalentDomains)initWithMostUnpleasantDomains:(id)a3 mostPleasantDomains:(id)a4 dayIndexRange:(id)a5
{
  int64_t var1;
  int64_t var0;
  id v10;
  id v11;
  HKMHMostPrevalentDomains *v12;
  HKMHMostPrevalentDomains *v13;
  objc_super v15;

  var1 = a5.var1;
  var0 = a5.var0;
  v10 = a3;
  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKMHMostPrevalentDomains;
  v12 = -[HKMHMostPrevalentDomains init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_mostUnpleasantDomains, a3);
    objc_storeStrong((id *)&v13->_mostPleasantDomains, a4);
    v13->_dayIndexRange.start = var0;
    v13->_dayIndexRange.duration = var1;
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  HKMHDomainSummary *mostUnpleasantDomains;
  HKMHDomainSummary *v7;
  HKMHDomainSummary *mostPleasantDomains;
  HKMHDomainSummary *v9;
  BOOL v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    mostUnpleasantDomains = self->_mostUnpleasantDomains;
    v7 = (HKMHDomainSummary *)v5[1];
    v11 = (mostUnpleasantDomains == v7 || v7 && -[HKMHDomainSummary isEqual:](mostUnpleasantDomains, "isEqual:"))
       && ((mostPleasantDomains = self->_mostPleasantDomains, v9 = (HKMHDomainSummary *)v5[2], mostPleasantDomains == v9)
        || v9 && -[HKMHDomainSummary isEqual:](mostPleasantDomains, "isEqual:"))
       && self->_dayIndexRange.start == v5[3]
       && self->_dayIndexRange.duration == v5[4];

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[HKMHDomainSummary hash](self->_mostPleasantDomains, "hash");
  return -[HKMHDomainSummary hash](self->_mostUnpleasantDomains, "hash") ^ v3 ^ self->_dayIndexRange.duration ^ self->_dayIndexRange.start;
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
  NSStringFromHKDayIndexRange();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMHDomainSummary description](self->_mostUnpleasantDomains, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKMHDomainSummary description](self->_mostPleasantDomains, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p Day Index Range:%@ Unpleasant:%@ Pleasant:%@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKMHMostPrevalentDomains)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  HKMHMostPrevalentDomains *v9;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PleasantDomains"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UnpleasantDomains"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DayIndexRangeStart"));
  v8 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DayIndexRangeDuration"));

  v9 = -[HKMHMostPrevalentDomains initWithMostUnpleasantDomains:mostPleasantDomains:dayIndexRange:](self, "initWithMostUnpleasantDomains:mostPleasantDomains:dayIndexRange:", v6, v5, v7, v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t start;
  id v5;

  start = self->_dayIndexRange.start;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", start, CFSTR("DayIndexRangeStart"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_dayIndexRange.duration, CFSTR("DayIndexRangeDuration"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mostUnpleasantDomains, CFSTR("UnpleasantDomains"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mostPleasantDomains, CFSTR("PleasantDomains"));

}

- ($0AC6E346AE4835514AAA8AC86D8F4844)dayIndexRange
{
  int64_t duration;
  int64_t start;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  duration = self->_dayIndexRange.duration;
  start = self->_dayIndexRange.start;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (HKMHDomainSummary)mostUnpleasantDomains
{
  return self->_mostUnpleasantDomains;
}

- (HKMHDomainSummary)mostPleasantDomains
{
  return self->_mostPleasantDomains;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mostPleasantDomains, 0);
  objc_storeStrong((id *)&self->_mostUnpleasantDomains, 0);
}

@end
