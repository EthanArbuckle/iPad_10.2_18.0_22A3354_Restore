@implementation ATXDailyOverviewOptions

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXDailyOverviewOptions)initWithFocusFilter:(int64_t)a3 isModernDashboardLayout:(BOOL)a4
{
  ATXDailyOverviewOptions *v6;
  ATXDailyOverviewOptions *v7;
  ATXDailyOverviewOptions *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ATXDailyOverviewOptions;
  v6 = -[ATXDailyOverviewOptions init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_focusFilter = a3;
    v6->_isModernDashboardLayout = a4;
    v8 = v6;
  }

  return v7;
}

- (ATXDailyOverviewOptions)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("focusFilter"));
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isModernDashboardLayout"));

  return -[ATXDailyOverviewOptions initWithFocusFilter:isModernDashboardLayout:](self, "initWithFocusFilter:isModernDashboardLayout:", v5, v6);
}

- (void)encodeWithCoder:(id)a3
{
  int64_t focusFilter;
  id v5;

  focusFilter = self->_focusFilter;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", focusFilter, CFSTR("focusFilter"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isModernDashboardLayout, CFSTR("isModernDashboardLayout"));

}

- (BOOL)isEqual:(id)a3
{
  ATXDailyOverviewOptions *v4;
  ATXDailyOverviewOptions *v5;
  BOOL v6;

  v4 = (ATXDailyOverviewOptions *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXDailyOverviewOptions isEqualToATXDailyOverviewOptions:](self, "isEqualToATXDailyOverviewOptions:", v5);

  return v6;
}

- (BOOL)isEqualToATXDailyOverviewOptions:(id)a3
{
  id v4;
  uint64_t v5;
  int v6;
  int v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "focusFilter");
  if (v5 == -[ATXDailyOverviewOptions focusFilter](self, "focusFilter"))
  {
    v6 = objc_msgSend(v4, "isModernDashboardLayout");
    v7 = v6 ^ -[ATXDailyOverviewOptions isModernDashboardLayout](self, "isModernDashboardLayout") ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  int64_t focusFilter;

  focusFilter = self->_focusFilter;
  return focusFilter ^ -[ATXDailyOverviewOptions isModernDashboardLayout](self, "isModernDashboardLayout");
}

- (int64_t)focusFilter
{
  return self->_focusFilter;
}

- (BOOL)isModernDashboardLayout
{
  return self->_isModernDashboardLayout;
}

@end
