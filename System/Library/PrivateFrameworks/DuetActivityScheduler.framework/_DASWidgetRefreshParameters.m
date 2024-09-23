@implementation _DASWidgetRefreshParameters

- (_DASWidgetRefreshParameters)initWithIdentifier:(id)a3 withBudgetIdentifier:(id)a4 withRateLimitConfigurationName:(id)a5 withRemoteDeviceIdentifier:(id)a6 withAppIdentifier:(id)a7 refreshAfter:(id)a8 refreshBefore:(id)a9
{
  id v16;
  id v17;
  _DASWidgetRefreshParameters *v18;
  _DASWidgetRefreshParameters *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  objc_super v26;

  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v16 = a8;
  v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)_DASWidgetRefreshParameters;
  v18 = -[_DASWidgetRefreshParameters init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_widgetIdentifier, a3);
    objc_storeStrong((id *)&v19->_widgetBudgetIdentifier, a4);
    objc_storeStrong((id *)&v19->_ratelimitConfigurationName, a5);
    objc_storeStrong((id *)&v19->_remoteDeviceIdentifier, a6);
    objc_storeStrong((id *)&v19->_appIdentifier, a7);
    objc_storeStrong((id *)&v19->_refreshAfterDate, a8);
    objc_storeStrong((id *)&v19->_refreshBeforeDate, a9);
  }

  return v19;
}

- (NSString)widgetIdentifier
{
  return self->_widgetIdentifier;
}

- (void)setWidgetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_widgetIdentifier, a3);
}

- (NSString)widgetBudgetIdentifier
{
  return self->_widgetBudgetIdentifier;
}

- (void)setWidgetBudgetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_widgetBudgetIdentifier, a3);
}

- (NSString)ratelimitConfigurationName
{
  return self->_ratelimitConfigurationName;
}

- (void)setRatelimitConfigurationName:(id)a3
{
  objc_storeStrong((id *)&self->_ratelimitConfigurationName, a3);
}

- (NSString)remoteDeviceIdentifier
{
  return self->_remoteDeviceIdentifier;
}

- (void)setRemoteDeviceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDeviceIdentifier, a3);
}

- (NSString)appIdentifier
{
  return self->_appIdentifier;
}

- (void)setAppIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_appIdentifier, a3);
}

- (NSDate)refreshBeforeDate
{
  return self->_refreshBeforeDate;
}

- (void)setRefreshBeforeDate:(id)a3
{
  objc_storeStrong((id *)&self->_refreshBeforeDate, a3);
}

- (NSDate)refreshAfterDate
{
  return self->_refreshAfterDate;
}

- (void)setRefreshAfterDate:(id)a3
{
  objc_storeStrong((id *)&self->_refreshAfterDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshAfterDate, 0);
  objc_storeStrong((id *)&self->_refreshBeforeDate, 0);
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_remoteDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_ratelimitConfigurationName, 0);
  objc_storeStrong((id *)&self->_widgetBudgetIdentifier, 0);
  objc_storeStrong((id *)&self->_widgetIdentifier, 0);
}

@end
