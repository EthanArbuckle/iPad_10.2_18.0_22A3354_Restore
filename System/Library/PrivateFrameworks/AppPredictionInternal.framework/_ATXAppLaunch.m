@implementation _ATXAppLaunch

- (_ATXAppLaunch)initWithBundleId:(id)a3 startDate:(id)a4 endDate:(id)a5 timeZone:(id)a6 reason:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  _ATXAppLaunch *v17;
  uint64_t v18;
  NSString *bundleId;
  uint64_t v20;
  NSDate *startDate;
  uint64_t v22;
  NSDate *endDate;
  uint64_t v24;
  NSTimeZone *timeZone;
  uint64_t v26;
  NSString *reason;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)_ATXAppLaunch;
  v17 = -[_ATXAppLaunch init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    bundleId = v17->_bundleId;
    v17->_bundleId = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    startDate = v17->_startDate;
    v17->_startDate = (NSDate *)v20;

    v22 = objc_msgSend(v14, "copy");
    endDate = v17->_endDate;
    v17->_endDate = (NSDate *)v22;

    if (v15)
    {
      v24 = objc_msgSend(v15, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v24 = objc_claimAutoreleasedReturnValue();
    }
    timeZone = v17->_timeZone;
    v17->_timeZone = (NSTimeZone *)v24;

    v26 = objc_msgSend(v16, "copy");
    reason = v17->_reason;
    v17->_reason = (NSString *)v26;

  }
  return v17;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@, %@, %@)"), self->_bundleId, self->_startDate, self->_endDate);
}

- (BOOL)isEqual:(id)a3
{
  _ATXAppLaunch *v4;
  _ATXAppLaunch *v5;
  BOOL v6;

  v4 = (_ATXAppLaunch *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[_ATXAppLaunch isEqualToLaunch:](self, "isEqualToLaunch:", v5);

  return v6;
}

- (BOOL)isEqualToLaunch:(id)a3
{
  id *v4;
  NSString *bundleId;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  char v9;
  _ATXAppLaunch *v10;
  id *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSTimeZone *v19;
  char v20;

  v4 = (id *)a3;
  bundleId = self->_bundleId;
  v6 = (NSString *)v4[1];
  if (bundleId == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = bundleId;
    v9 = -[NSString isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_9;
  }
  v10 = self;
  v11 = v4;
  -[NSDate timeIntervalSinceReferenceDate](v10->_startDate, "timeIntervalSinceReferenceDate");
  v13 = v12;
  objc_msgSend(v11[2], "timeIntervalSinceReferenceDate");
  if (v13 != v14)
  {

    v20 = 0;
LABEL_12:

    goto LABEL_13;
  }
  -[NSDate timeIntervalSinceReferenceDate](v10->_endDate, "timeIntervalSinceReferenceDate");
  v16 = v15;
  objc_msgSend(v11[3], "timeIntervalSinceReferenceDate");
  v18 = v17;

  if (v16 == v18)
  {
    v19 = v10->_timeZone;
    v10 = (_ATXAppLaunch *)v19;
    if (v19 == v11[4])
      v20 = 1;
    else
      v20 = -[NSTimeZone isEqual:](v19, "isEqual:");
    goto LABEL_12;
  }
LABEL_9:
  v20 = 0;
LABEL_13:

  return v20;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_bundleId, "hash");
  return -[NSDate hash](self->_startDate, "hash") - v3 + 32 * v3;
}

- (id)eventTime
{
  return self->_startDate;
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (NSString)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

@end
