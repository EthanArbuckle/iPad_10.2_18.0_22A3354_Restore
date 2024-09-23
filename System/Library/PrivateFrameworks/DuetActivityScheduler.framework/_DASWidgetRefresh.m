@implementation _DASWidgetRefresh

- (_DASWidgetRefresh)initWithBudgetID:(id)a3 extensionBundleID:(id)a4 refreshDate:(id)a5
{
  id v9;
  id *v10;
  _DASWidgetRefresh *v11;

  v9 = a5;
  v10 = -[_DASWidgetInfo _initWithBudgetID:extensionBundleID:](self, "_initWithBudgetID:extensionBundleID:", a3, a4);
  v11 = (_DASWidgetRefresh *)v10;
  if (v10)
    objc_storeStrong(v10 + 4, a5);

  return v11;
}

- (_DASWidgetRefresh)initWithRateLimitConfigurationName:(id)a3 budgetID:(id)a4 extensionBundleID:(id)a5 refreshDate:(id)a6 initiatedByDAS:(BOOL)a7
{
  id v12;
  id v13;
  id *v14;
  _DASWidgetRefresh *v15;
  uint64_t v16;
  NSString *rateLimitConfigurationName;

  v12 = a3;
  v13 = a6;
  v14 = -[_DASWidgetInfo _initWithBudgetID:extensionBundleID:](self, "_initWithBudgetID:extensionBundleID:", a4, a5);
  v15 = (_DASWidgetRefresh *)v14;
  if (v14)
  {
    objc_storeStrong(v14 + 4, a6);
    if (v12)
    {
      v16 = objc_msgSend(v12, "copy");
      rateLimitConfigurationName = v15->_rateLimitConfigurationName;
      v15->_rateLimitConfigurationName = (NSString *)v16;

    }
    v15->_isDASInitiated = a7;
  }

  return v15;
}

+ (id)refreshAt:(id)a3 forWidgetID:(id)a4
{
  id v5;
  id v6;
  _DASWidgetRefresh *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[_DASWidgetRefresh initWithBudgetID:extensionBundleID:refreshDate:]([_DASWidgetRefresh alloc], "initWithBudgetID:extensionBundleID:refreshDate:", v5, CFSTR("unknown"), v6);

  return v7;
}

- (NSDate)refreshDate
{
  return self->_refreshDate;
}

- (BOOL)isDASInitiated
{
  return self->_isDASInitiated;
}

- (void)setIsDASInitiated:(BOOL)a3
{
  self->_isDASInitiated = a3;
}

- (NSString)refreshReason
{
  return self->_refreshReason;
}

- (void)setRefreshReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)rateLimitConfigurationName
{
  return self->_rateLimitConfigurationName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rateLimitConfigurationName, 0);
  objc_storeStrong((id *)&self->_refreshReason, 0);
  objc_storeStrong((id *)&self->_refreshDate, 0);
}

@end
