@implementation RTPeopleDensityCallbackConfiguration

- (RTPeopleDensityCallbackConfiguration)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPeriodicReportInterval_magnitude_densityUpdateHandler_);
}

- (RTPeopleDensityCallbackConfiguration)initWithPeriodicReportInterval:(unint64_t)a3 magnitude:(unint64_t)a4 densityUpdateHandler:(id)a5
{
  id v8;
  RTPeopleDensityCallbackConfiguration *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id densityUpdateHandler;
  objc_super v15;
  uint8_t buf[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)RTPeopleDensityCallbackConfiguration;
  v9 = -[RTPeopleDensityCallbackConfiguration init](&v15, sel_init);
  if (v9)
  {
    if (a3 >= 4)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v17 = a3;
        _os_log_error_impl(&dword_1A5E26000, v10, OS_LOG_TYPE_ERROR, "interval %d out of bounds", buf, 8u);
      }

      a3 = 0;
    }
    v9->_periodicReportInterval = a3;
    if (a4 >= 3)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGathering);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        v17 = a4;
        _os_log_error_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_ERROR, "magnitude %d out of bounds", buf, 8u);
      }

      a4 = 0;
    }
    v9->_magnitude = a4;
    v12 = MEMORY[0x1A85B6C24](v8);
    densityUpdateHandler = v9->_densityUpdateHandler;
    v9->_densityUpdateHandler = (id)v12;

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  RTPeopleDensityCallbackConfiguration *v4;
  RTPeopleDensityCallbackConfiguration *v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;

  v4 = (RTPeopleDensityCallbackConfiguration *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[RTPeopleDensityCallbackConfiguration periodicReportInterval](self, "periodicReportInterval");
      if (v6 == -[RTPeopleDensityCallbackConfiguration periodicReportInterval](v5, "periodicReportInterval"))
      {
        v7 = -[RTPeopleDensityCallbackConfiguration magnitude](self, "magnitude");
        v8 = v7 == -[RTPeopleDensityCallbackConfiguration magnitude](v5, "magnitude");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)descriptionDictionary
{
  unint64_t periodicReportInterval;
  NSObject *v4;
  unint64_t magnitude;
  NSObject *v6;
  const __CFString *v7;
  const __CFString *v8;
  objc_class *v10;
  void *v11;
  unint64_t v12;
  objc_class *v13;
  void *v14;
  unint64_t v15;
  _QWORD v16[2];
  _QWORD v17[2];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  periodicReportInterval = self->_periodicReportInterval;
  if (periodicReportInterval >= 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = self->_periodicReportInterval;
      *(_DWORD *)buf = 138412546;
      v19 = v11;
      v20 = 1024;
      v21 = v12;
      _os_log_error_impl(&dword_1A5E26000, v4, OS_LOG_TYPE_ERROR, "%@ invalid periodicInterval %d", buf, 0x12u);

    }
  }
  magnitude = self->_magnitude;
  if (magnitude >= 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = self->_magnitude;
      *(_DWORD *)buf = 138412546;
      v19 = v14;
      v20 = 1024;
      v21 = v15;
      _os_log_error_impl(&dword_1A5E26000, v6, OS_LOG_TYPE_ERROR, "%@ invalid magnitude %d", buf, 0x12u);

    }
  }
  v16[0] = CFSTR("interval");
  if (periodicReportInterval > 3)
    v7 = &stru_1E4FB1A18;
  else
    v7 = PeriodicReportIntervalDescriptor[self->_periodicReportInterval];
  v17[0] = v7;
  v16[1] = CFSTR("magnitude");
  if (magnitude > 2)
    v8 = &stru_1E4FB1A18;
  else
    v8 = UpdateMagnitudeDescriptor[self->_magnitude];
  v17[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  objc_class *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[RTPeopleDensityCallbackConfiguration descriptionDictionary](self, "descriptionDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONStringFromNSDictionary:error:", v2, &v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v11;
  if (v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGathering);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v13 = v10;
      v14 = 2112;
      v15 = v4;
      _os_log_error_impl(&dword_1A5E26000, v5, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "string");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;

  v4 = objc_alloc((Class)objc_opt_class());
  v5 = -[RTPeopleDensityCallbackConfiguration periodicReportInterval](self, "periodicReportInterval");
  v6 = -[RTPeopleDensityCallbackConfiguration magnitude](self, "magnitude");
  -[RTPeopleDensityCallbackConfiguration densityUpdateHandler](self, "densityUpdateHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithPeriodicReportInterval:magnitude:densityUpdateHandler:", v5, v6, v7);

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTPeopleDensityCallbackConfiguration)initWithCoder:(id)a3
{
  id v4;
  double v5;
  unint64_t v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("interval"));
  v6 = (unint64_t)v5;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("magnitude"));
  v8 = v7;

  return -[RTPeopleDensityCallbackConfiguration initWithPeriodicReportInterval:magnitude:densityUpdateHandler:](self, "initWithPeriodicReportInterval:magnitude:densityUpdateHandler:", v6, (unint64_t)v8, 0);
}

- (void)encodeWithCoder:(id)a3
{
  double periodicReportInterval;
  id v5;

  periodicReportInterval = (double)self->_periodicReportInterval;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("interval"), periodicReportInterval);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("magnitude"), (double)self->_magnitude);

}

- (unint64_t)periodicReportInterval
{
  return self->_periodicReportInterval;
}

- (unint64_t)magnitude
{
  return self->_magnitude;
}

- (id)densityUpdateHandler
{
  return self->_densityUpdateHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_densityUpdateHandler, 0);
}

@end
