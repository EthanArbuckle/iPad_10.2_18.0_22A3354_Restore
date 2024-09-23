@implementation ATXSettingsActionsClientRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXSettingsActionsClientRequest)initWithCoder:(id)a3
{
  id v4;
  ATXSettingsActionsClientRequest *v5;
  uint64_t v6;
  NSDate *startDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXSettingsActionsClientRequest;
  v5 = -[ATXSettingsActionsClientRequest init](&v9, sel_init);
  if (v5)
  {
    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("limit"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t limit;
  id v5;

  limit = self->_limit;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", limit, CFSTR("limit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));

}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
