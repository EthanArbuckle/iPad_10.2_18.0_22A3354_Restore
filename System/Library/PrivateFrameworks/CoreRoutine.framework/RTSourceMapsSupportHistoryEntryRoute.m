@implementation RTSourceMapsSupportHistoryEntryRoute

- (RTSourceMapsSupportHistoryEntryRoute)initWithUsageDate:(id)a3 navigationWasInterrupted:(BOOL)a4
{
  RTSourceMapsSupportHistoryEntryRoute *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RTSourceMapsSupportHistoryEntryRoute;
  result = -[RTSourceMapsSupportHistoryEntry initWithUsageDate:](&v6, sel_initWithUsageDate_, a3);
  if (result)
    result->_navigationWasInterrupted = a4;
  return result;
}

- (RTSourceMapsSupportHistoryEntryRoute)initWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  RTSourceMapsSupportHistoryEntryRoute *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[RTSourceMapsSupportHistoryEntryRoute initWithCoder:]";
      v12 = 1024;
      v13 = 31;
      _os_log_error_impl(&dword_1A5E26000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [aDecoder allowsKeyedCoding] (in %s:%d)", buf, 0x12u);
    }

  }
  v9.receiver = self;
  v9.super_class = (Class)RTSourceMapsSupportHistoryEntryRoute;
  v6 = -[RTSourceMapsSupportHistoryEntry initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("navigationWasInterrupted"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_navigationWasInterrupted = objc_msgSend(v7, "BOOLValue");

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((objc_msgSend(v4, "allowsKeyedCoding") & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v9 = "-[RTSourceMapsSupportHistoryEntryRoute encodeWithCoder:]";
      v10 = 1024;
      v11 = 43;
      _os_log_error_impl(&dword_1A5E26000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [aCoder allowsKeyedCoding] (in %s:%d)", buf, 0x12u);
    }

  }
  v7.receiver = self;
  v7.super_class = (Class)RTSourceMapsSupportHistoryEntryRoute;
  -[RTSourceMapsSupportHistoryEntry encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_navigationWasInterrupted);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("navigationWasInterrupted"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  BOOL v6;
  char v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RTSourceMapsSupportHistoryEntryRoute;
  if (-[RTSourceMapsSupportHistoryEntry isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    v6 = -[RTSourceMapsSupportHistoryEntryRoute navigationWasInterrupted](self, "navigationWasInterrupted");
    v7 = objc_msgSend(v5, "navigationWasInterrupted");

    v8 = v6 ^ v7 ^ 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RTSourceMapsSupportHistoryEntryRoute;
  v3 = -[RTSourceMapsSupportHistoryEntry hash](&v7, sel_hash);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[RTSourceMapsSupportHistoryEntryRoute navigationWasInterrupted](self, "navigationWasInterrupted"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)RTSourceMapsSupportHistoryEntryRoute;
  -[RTSourceMapsSupportHistoryEntry description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTSourceMapsSupportHistoryEntryRoute navigationWasInterrupted](self, "navigationWasInterrupted");
  v6 = CFSTR("NO");
  if (v5)
    v6 = CFSTR("YES");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, navigationWasInterrupted, %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)navigationWasInterrupted
{
  return self->_navigationWasInterrupted;
}

@end
