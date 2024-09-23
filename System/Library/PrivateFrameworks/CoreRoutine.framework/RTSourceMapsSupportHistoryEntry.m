@implementation RTSourceMapsSupportHistoryEntry

- (RTSourceMapsSupportHistoryEntry)initWithUsageDate:(id)a3
{
  id v4;
  RTSourceMapsSupportHistoryEntry *v5;
  uint64_t v6;
  NSDate *usageDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTSourceMapsSupportHistoryEntry;
  v5 = -[RTSourceMapsSupportHistoryEntry init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    usageDate = v5->_usageDate;
    v5->_usageDate = (NSDate *)v6;

  }
  return v5;
}

- (RTSourceMapsSupportHistoryEntry)initWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  RTSourceMapsSupportHistoryEntry *v6;
  uint64_t v7;
  NSDate *usageDate;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v12 = "-[RTSourceMapsSupportHistoryEntry initWithCoder:]";
      v13 = 1024;
      v14 = 28;
      _os_log_error_impl(&dword_1A5E26000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [aDecoder allowsKeyedCoding] (in %s:%d)", buf, 0x12u);
    }

  }
  v10.receiver = self;
  v10.super_class = (Class)RTSourceMapsSupportHistoryEntry;
  v6 = -[RTSource initWithCoder:](&v10, sel_initWithCoder_, v4);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("usageDate"));
    v7 = objc_claimAutoreleasedReturnValue();
    usageDate = v6->_usageDate;
    v6->_usageDate = (NSDate *)v7;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v8 = "-[RTSourceMapsSupportHistoryEntry encodeWithCoder:]";
      v9 = 1024;
      v10 = 40;
      _os_log_error_impl(&dword_1A5E26000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [aCoder allowsKeyedCoding] (in %s:%d)", buf, 0x12u);
    }

  }
  v6.receiver = self;
  v6.super_class = (Class)RTSourceMapsSupportHistoryEntry;
  -[RTSource encodeWithCoder:](&v6, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_usageDate, CFSTR("usageDate"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)RTSourceMapsSupportHistoryEntry;
  if (-[RTSource isEqual:](&v12, sel_isEqual_, v5))
  {
    v6 = v5;
    -[RTSourceMapsSupportHistoryEntry usageDate](self, "usageDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 || (objc_msgSend(v6, "usageDate"), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      -[RTSourceMapsSupportHistoryEntry usageDate](self, "usageDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "usageDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToDate:", v9);

      if (v7)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      v10 = 1;
    }

    goto LABEL_9;
  }
  v10 = 0;
LABEL_10:

  return v10;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RTSourceMapsSupportHistoryEntry;
  v3 = -[RTSource hash](&v7, sel_hash);
  -[RTSourceMapsSupportHistoryEntry usageDate](self, "usageDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)RTSourceMapsSupportHistoryEntry;
  -[RTSource description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTSourceMapsSupportHistoryEntry usageDate](self, "usageDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, usageDate, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDate)usageDate
{
  return self->_usageDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageDate, 0);
}

@end
