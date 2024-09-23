@implementation ASDUpdatePollMetrics

- (ASDUpdatePollMetrics)initWithDictionary:(id)a3
{
  id v4;
  ASDUpdatePollMetrics *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSDate *pollTime;
  uint64_t v10;
  NSString *reason;
  uint64_t v12;
  NSArray *bundleIDs;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASDUpdatePollMetrics;
  v5 = -[ASDUpdatePollMetrics init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("date"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v6, "doubleValue");
      objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:");
      v8 = objc_claimAutoreleasedReturnValue();
      pollTime = v5->_pollTime;
      v5->_pollTime = (NSDate *)v8;

    }
    objc_msgSend(v4, "objectForKey:", CFSTR("reason"));
    v10 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v10;

    objc_msgSend(v4, "objectForKey:", CFSTR("bundleIDs"));
    v12 = objc_claimAutoreleasedReturnValue();
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v12;

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[ASDUpdatePollMetrics pollTime](self, "pollTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDUpdatePollMetrics reason](self, "reason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASDUpdatePollMetrics bundleIDs](self, "bundleIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{ %@: %@, %@: %@, %@ : [%@] }"), CFSTR("date"), v4, CFSTR("reason"), v5, CFSTR("bundleIDs"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[ASDUpdatePollMetrics pollTime](self, "pollTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("date"));

  -[ASDUpdatePollMetrics reason](self, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("reason"));

  -[ASDUpdatePollMetrics bundleIDs](self, "bundleIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("bundleIDs"));

  return v3;
}

- (NSDate)pollTime
{
  return self->_pollTime;
}

- (void)setPollTime:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_pollTime, 0);
}

@end
