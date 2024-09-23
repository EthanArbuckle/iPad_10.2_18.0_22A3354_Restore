@implementation CLSHolidayCalendarEventOverrides

- (CLSHolidayCalendarEventOverrides)initWithUUID:(id)a3 countryCode:(id)a4 dateRuleOverrides:(id)a5 locationScore:(double)a6 sceneImportanceOverrides:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  CLSHolidayCalendarEventOverrides *v17;
  CLSHolidayCalendarEventOverrides *v18;
  objc_super v20;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)CLSHolidayCalendarEventOverrides;
  v17 = -[CLSHolidayCalendarEventOverrides init](&v20, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_uuid, a3);
    objc_storeStrong((id *)&v18->_countryCode, a4);
    objc_storeStrong((id *)&v18->_dateRuleOverrides, a5);
    v18->_locationScore = a6;
    objc_storeStrong((id *)&v18->_sceneImportanceOverrides, a7);
  }

  return v18;
}

- (id)sceneImportanceStringForSceneName:(id)a3
{
  return -[NSDictionary objectForKeyedSubscript:](self->_sceneImportanceOverrides, "objectForKeyedSubscript:", a3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (NSArray)dateRuleOverrides
{
  return self->_dateRuleOverrides;
}

- (double)locationScore
{
  return self->_locationScore;
}

- (NSDictionary)sceneImportanceOverrides
{
  return self->_sceneImportanceOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneImportanceOverrides, 0);
  objc_storeStrong((id *)&self->_dateRuleOverrides, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
