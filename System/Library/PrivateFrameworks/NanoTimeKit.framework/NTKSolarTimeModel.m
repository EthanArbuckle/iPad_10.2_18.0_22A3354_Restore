@implementation NTKSolarTimeModel

- (NTKSolarTimeModel)init
{
  return -[NTKSolarTimeModel initWithReferenceDate:referenceLocation:](self, "initWithReferenceDate:referenceLocation:", 0, 0);
}

- (NTKSolarTimeModel)initWithReferenceDate:(id)a3 referenceLocation:(id)a4
{
  return -[NTKSolarTimeModel initWithReferenceDate:referenceLocation:twilightType:](self, "initWithReferenceDate:referenceLocation:twilightType:", a3, a4, 0);
}

- (NTKSolarTimeModel)initWithReferenceDate:(id)a3 referenceLocation:(id)a4 twilightType:(unint64_t)a5
{
  id v9;
  id v10;
  NTKSolarTimeModel *v11;
  NSObject *v12;
  objc_super v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NTKSolarTimeModel;
  v11 = -[NTKSolarTimeModel init](&v14, sel_init);
  if (v11)
  {
    _NTKLoggingObjectForDomain(34, (uint64_t)"NTKLoggingDomainSolar");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412803;
      v16 = v9;
      v17 = 2113;
      v18 = v10;
      v19 = 2048;
      v20 = a5;
      _os_log_debug_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEBUG, "SolarTimeModel initWithReferenceDate:%@, referenceLocation:%{private}@, twilightType:%lu", buf, 0x20u);
    }

    objc_storeStrong((id *)&v11->_referenceDate, a3);
    objc_storeStrong((id *)&v11->_referenceLocation, a4);
    v11->_twilightType = a5;
    v11->_dependentValuesNeedUpdate = 1;
  }

  return v11;
}

- (BOOL)includesDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  v4 = a3;
  -[NTKSolarTimeModel _updateDependentValues](self, "_updateDependentValues");
  -[NTKSolarTimeModel startDateForReferenceDate](self, "startDateForReferenceDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  -[NTKSolarTimeModel endDateForReferenceDate](self, "endDateForReferenceDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v12 = v11;

  return v12 <= v10 && v12 >= v7;
}

- (double)percentageThroughPeriodForIdealizedTimeInCurrentSolarDay
{
  void *v3;
  double v4;
  double v5;

  NTKIdealizedDate();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKSolarTimeModel percentageThroughPeriodInCurrentSolarDayForDate:](self, "percentageThroughPeriodInCurrentSolarDayForDate:", v3);
  v5 = v4;

  return v5;
}

- (id)normalizeDateIntervalForDate:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v5 = v4;
  -[NTKSolarTimeModel startDateForReferenceDate](self, "startDateForReferenceDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;

  -[NTKSolarTimeModel endDateForReferenceDate](self, "endDateForReferenceDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  v11 = v10;

  for (; v5 > v11; v5 = v5 + -86400.0)
    ;
  for (; v5 < v8; v5 = v5 + 86400.0)
    ;
  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v5);
}

- (double)percentageThroughPeriodInCurrentSolarDayForDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  -[NTKSolarTimeModel _updateDependentValues](self, "_updateDependentValues");
  -[NTKSolarTimeModel normalizeDateIntervalForDate:](self, "normalizeDateIntervalForDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NTKSolarTimeModel percentageThroughPeriodForDate:](self, "percentageThroughPeriodForDate:", v5);
  v7 = v6;

  return v7;
}

- (double)percentageThroughPeriodForDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double result;

  v4 = a3;
  -[NTKSolarTimeModel _updateDependentValues](self, "_updateDependentValues");
  -[NTKSolarTimeModel startDateForReferenceDate](self, "startDateForReferenceDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  -[NTKSolarTimeModel endDateForReferenceDate](self, "endDateForReferenceDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v12 = v11;

  result = 0.0;
  if (v10 - v7 > 0.0)
    return (v12 - v7) / (v10 - v7);
  return result;
}

- (id)dateForPercentageThroughPeriod:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  -[NTKSolarTimeModel _updateDependentValues](self, "_updateDependentValues");
  -[NTKSolarTimeModel startDateForReferenceDate](self, "startDateForReferenceDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;

  -[NTKSolarTimeModel endDateForReferenceDate](self, "endDateForReferenceDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  return (id)objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v7 + (v10 - v7) * a3);
}

- (id)_nextEvent:(id)a3 ofType:(unsigned int)a4
{
  double v4;

  objc_msgSend(a3, "nextEventOfType:", *(_QWORD *)&a4);
  if (v4 == 0.0)
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_updateDependentValues
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  objc_msgSend(*a1, "coordinate");
  v6 = v5;
  objc_msgSend(*a1, "coordinate");
  v8 = 138478339;
  v9 = v4;
  v10 = 2049;
  v11 = v6;
  v12 = 2049;
  v13 = v7;
  _os_log_debug_impl(&dword_1B72A3000, a2, OS_LOG_TYPE_DEBUG, "SolarTimeModel referenceLocation: %{private}@ latitue: %{private}f longitude: %{private}f ", (uint8_t *)&v8, 0x20u);
}

- (void)updateForTimeZoneChange
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[NTKSolarTimeModel updateForTimeZoneChange]";
  _os_log_debug_impl(&dword_1B72A3000, log, OS_LOG_TYPE_DEBUG, "SolarTimeModel %s", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)setReferenceDate:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqualToDate:", self->_referenceDate) & 1) == 0)
  {
    _NTKLoggingObjectForDomain(34, (uint64_t)"NTKLoggingDomainSolar");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[NTKSolarTimeModel setReferenceDate:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

    objc_storeStrong((id *)&self->_referenceDate, a3);
    -[NTKSolarTimeModel setDependentValuesNeedUpdate:](self, "setDependentValuesNeedUpdate:", 1);
  }

}

- (void)setReferenceLocation:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_referenceLocation) & 1) == 0)
  {
    _NTKLoggingObjectForDomain(34, (uint64_t)"NTKLoggingDomainSolar");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[NTKSolarTimeModel setReferenceLocation:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

    objc_storeStrong((id *)&self->_referenceLocation, a3);
    -[NTKSolarTimeModel setDependentValuesNeedUpdate:](self, "setDependentValuesNeedUpdate:", 1);
  }

}

- (void)setUsePlaceholderData:(BOOL)a3
{
  if (self->_usePlaceholderData != a3)
  {
    self->_usePlaceholderData = a3;
    -[NTKSolarTimeModel setDependentValuesNeedUpdate:](self, "setDependentValuesNeedUpdate:", 1);
  }
}

- (NSDate)startDateForReferenceDate
{
  -[NTKSolarTimeModel _updateDependentValues](self, "_updateDependentValues");
  return self->_startDateForReferenceDate;
}

- (NSDate)endDateForReferenceDate
{
  -[NTKSolarTimeModel _updateDependentValues](self, "_updateDependentValues");
  return self->_endDateForReferenceDate;
}

- (NSDate)localSolarMidnightDate
{
  -[NTKSolarTimeModel _updateDependentValues](self, "_updateDependentValues");
  return self->_localSolarMidnightDate;
}

- (NSDate)localSunriseDate
{
  -[NTKSolarTimeModel _updateDependentValues](self, "_updateDependentValues");
  return self->_localSunriseDate;
}

- (NSDate)localSunsetDate
{
  -[NTKSolarTimeModel _updateDependentValues](self, "_updateDependentValues");
  return self->_localSunsetDate;
}

- (NSDate)localDawnDate
{
  -[NTKSolarTimeModel _updateDependentValues](self, "_updateDependentValues");
  return self->_localDawnDate;
}

- (NSDate)localDuskDate
{
  -[NTKSolarTimeModel _updateDependentValues](self, "_updateDependentValues");
  return self->_localDuskDate;
}

- (NSDate)localSolarNoonDate
{
  -[NTKSolarTimeModel _updateDependentValues](self, "_updateDependentValues");
  return self->_localSolarNoonDate;
}

- (double)effectiveSolarDayLength
{
  -[NTKSolarTimeModel _updateDependentValues](self, "_updateDependentValues");
  return self->_effectiveSolarDayLength;
}

- (id)ntkCacheableKey
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  _BOOL8 usePlaceholderData;
  void *v8;
  double v9;
  uint64_t v10;
  double v11;
  void *v12;

  v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v3, "setDateFormat:", CFSTR("YYYY-MM-dd"));
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  usePlaceholderData = self->_usePlaceholderData;
  objc_msgSend(v3, "stringFromDate:", self->_referenceDate);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLLocation coordinate](self->_referenceLocation, "coordinate");
  v10 = (int)(v9 * 10000.0);
  -[CLLocation coordinate](self->_referenceLocation, "coordinate");
  objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@-usePlaceholderData:%d-date:%@-lat:%d-lon:%d]"), v6, usePlaceholderData, v8, v10, (int)(v11 * 10000.0));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (CLLocation)referenceLocation
{
  return self->_referenceLocation;
}

- (BOOL)usePlaceholderData
{
  return self->_usePlaceholderData;
}

- (void)setStartDateForReferenceDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDateForReferenceDate, a3);
}

- (void)setEndDateForReferenceDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDateForReferenceDate, a3);
}

- (void)setLocalSolarMidnightDate:(id)a3
{
  objc_storeStrong((id *)&self->_localSolarMidnightDate, a3);
}

- (void)setEffectiveSolarDayLength:(double)a3
{
  self->_effectiveSolarDayLength = a3;
}

- (void)setLocalSunriseDate:(id)a3
{
  objc_storeStrong((id *)&self->_localSunriseDate, a3);
}

- (void)setLocalSunsetDate:(id)a3
{
  objc_storeStrong((id *)&self->_localSunsetDate, a3);
}

- (void)setLocalDawnDate:(id)a3
{
  objc_storeStrong((id *)&self->_localDawnDate, a3);
}

- (void)setLocalDuskDate:(id)a3
{
  objc_storeStrong((id *)&self->_localDuskDate, a3);
}

- (void)setLocalSolarNoonDate:(id)a3
{
  objc_storeStrong((id *)&self->_localSolarNoonDate, a3);
}

- (NSDate)referenceDate
{
  return self->_referenceDate;
}

- (BOOL)dependentValuesNeedUpdate
{
  return self->_dependentValuesNeedUpdate;
}

- (void)setDependentValuesNeedUpdate:(BOOL)a3
{
  self->_dependentValuesNeedUpdate = a3;
}

- (unint64_t)twilightType
{
  return self->_twilightType;
}

- (void)setTwilightType:(unint64_t)a3
{
  self->_twilightType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referenceDate, 0);
  objc_storeStrong((id *)&self->_localSolarNoonDate, 0);
  objc_storeStrong((id *)&self->_localDuskDate, 0);
  objc_storeStrong((id *)&self->_localDawnDate, 0);
  objc_storeStrong((id *)&self->_localSunsetDate, 0);
  objc_storeStrong((id *)&self->_localSunriseDate, 0);
  objc_storeStrong((id *)&self->_localSolarMidnightDate, 0);
  objc_storeStrong((id *)&self->_endDateForReferenceDate, 0);
  objc_storeStrong((id *)&self->_startDateForReferenceDate, 0);
  objc_storeStrong((id *)&self->_referenceLocation, 0);
}

- (void)setReferenceDate:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1B72A3000, a2, a3, "SolarTimeModel %s to:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setReferenceLocation:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_10(&dword_1B72A3000, a2, a3, "SolarTimeModel %s to:%{private}@", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1();
}

@end
