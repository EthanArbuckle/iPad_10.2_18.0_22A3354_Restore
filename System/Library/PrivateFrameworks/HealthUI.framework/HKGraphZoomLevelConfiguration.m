@implementation HKGraphZoomLevelConfiguration

+ (id)chartDataRangeForTimeScope:(int64_t)a3 dataRange:(id)a4 firstWeekday:(int64_t)a5 calendar:(id)a6 cadence:(int64_t)a7 alignment:(int64_t)a8
{
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v34;

  v34 = a6;
  v15 = a4;
  objc_msgSend(v15, "minValue");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "maxValue");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v16;
  v19 = v17;
  v20 = v19;
  v21 = v19;
  v22 = v18;
  switch(a3)
  {
    case 0:
      v23 = v34;
      v24 = v34;
      v25 = v18;
      v26 = -9;
      goto LABEL_5;
    case 1:
      v23 = v34;
      v24 = v34;
      v25 = v18;
      v26 = -4;
      goto LABEL_5;
    case 2:
      v23 = v34;
      v24 = v34;
      v25 = v18;
      v26 = 0;
LABEL_5:
      objc_msgSend(v24, "hk_startOfYearForDate:addingYears:", v25, v26);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "hk_startOfYearForDate:addingYears:", v20, 1);
      v27 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 3:
      objc_msgSend(v34, "hk_sixMonthPeriodContaining:dateBefore:", v18, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "hk_sixMonthPeriodContaining:dateBefore:", v20, 0);
      v27 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 4:
      if (a7 == 1)
      {
        objc_msgSend(v34, "hk_startOfMonthForDate:addingMonths:", v18, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "hk_startOfMonthForDate:addingMonths:", v20, 1);
        v27 = objc_claimAutoreleasedReturnValue();
LABEL_16:
        v21 = (void *)v27;
        v29 = v20;
      }
      else
      {
        v21 = v19;
        v22 = v18;
        if (a7)
          goto LABEL_18;
        objc_msgSend(v34, "hk_startOfMonthForDate:addingMonths:", v18, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v34, "hk_startOfMonthForDate:addingMonths:", v20, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        v29 = objc_alloc_init(MEMORY[0x1E0C99D78]);
        objc_msgSend(v29, "setCalendar:", v34);
        objc_msgSend(v29, "setDay:", 1);
        objc_msgSend(v29, "hk_dateByAddingInterval:toDate:", 31, v28);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
LABEL_17:

LABEL_18:
      +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v22, v21);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      return v32;
    case 5:
      objc_msgSend(v34, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", a5, v18, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", a5, v20, 1);
      v27 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 6:
      objc_msgSend(v34, "hk_startOfDateByAddingDays:toDate:", 0, v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "hk_startOfDateByAddingDays:toDate:", 1, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (a8 != 4)
        goto LABEL_18;
      objc_msgSend(a1, "_gregorianCalendarForCalendar:", v34);
      v29 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hk_sleepDayStartWithCalendar:", v29);
      v30 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "hk_sleepDayStartWithCalendar:", v29);
      v31 = objc_claimAutoreleasedReturnValue();

      v21 = (void *)v31;
      v22 = (void *)v30;
      goto LABEL_17;
    case 7:
      objc_msgSend(v34, "hk_startOfHourForDate:addingHours:", v18, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v34, "hk_startOfHourForDate:addingHours:", v20, 1);
      v27 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCoordinateTransform.m"), 523, CFSTR("Invalid zoom level (%ld)"), 8);
      v21 = v20;
      v22 = v18;
      goto LABEL_17;
    default:
      goto LABEL_18;
  }
}

+ (id)_generateConfigurationForZoomLevel:(int64_t)a3
{
  NSDateComponents *v5;
  NSDateComponents *v6;
  NSDateComponents *v7;
  NSDateComponents *v8;
  NSDateComponents *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  NSDateComponents *v20;
  HKGraphZoomLevelConfiguration *v21;
  NSDateComponents *referencePointIntervalComponents;
  NSDateComponents *v23;
  NSDateComponents *seriesPointStandardIntervalComponents;
  NSDateComponents *seriesPointEnhancedIntervalComponents;
  NSDateComponents *v26;
  NSDateComponents *axisLabelIntervalComponents;
  NSDateComponents *v28;
  NSDateComponents *minorAxisIntervalComponents;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v38;
  void *v39;
  uint64_t v40;
  NSDateComponents *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSDateComponents *v50;
  int64_t v51;
  void *v53;
  void *v54;
  void *v55;

  if ((unint64_t)a3 >= 8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCoordinateTransform.m"), 214, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(zoom >= 0) && (zoom < HKTimeScopeCount)"));

  }
  v5 = (NSDateComponents *)objc_opt_new();
  v6 = (NSDateComponents *)objc_opt_new();
  v7 = (NSDateComponents *)objc_opt_new();
  v54 = (void *)objc_opt_new();
  v8 = (NSDateComponents *)objc_opt_new();
  v9 = (NSDateComponents *)objc_opt_new();
  v10 = (void *)objc_opt_new();
  v55 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v50 = v9;
  v51 = a3;
  switch(a3)
  {
    case 0:
      -[NSDateComponents setYear:](v5, "setYear:", 10);
      -[NSDateComponents setYear:](v8, "setYear:", 1);
      -[NSDateComponents setYear:](v6, "setYear:", 1);
      -[NSDateComponents setYear:](v7, "setYear:", 1);
      -[NSDateComponents setYear:](v9, "setYear:", 1);
      objc_msgSend(v54, "setYear:", 15);
      objc_msgSend(v55, "setYear:", 10);
      v12 = v10;
      v13 = 8;
      goto LABEL_6;
    case 1:
      -[NSDateComponents setYear:](v5, "setYear:", 5);
      -[NSDateComponents setYear:](v8, "setYear:", 1);
      -[NSDateComponents setYear:](v6, "setYear:", 1);
      -[NSDateComponents setYear:](v7, "setYear:", 1);
      -[NSDateComponents setYear:](v9, "setYear:", 1);
      objc_msgSend(v54, "setYear:", 1);
      objc_msgSend(v55, "setYear:", 5);
      v12 = v10;
      v13 = 3;
LABEL_6:
      objc_msgSend(v12, "setYear:", v13);
      objc_msgSend(v11, "setYear:", 1);
      v14 = 4;
      goto LABEL_15;
    case 2:
      -[NSDateComponents setYear:](v5, "setYear:", 1);
      -[NSDateComponents setMonth:](v8, "setMonth:", 1);
      -[NSDateComponents setMonth:](v6, "setMonth:", 1);
      -[NSDateComponents setMonth:](v7, "setMonth:", 1);
      -[NSDateComponents setMonth:](v9, "setMonth:", 1);
      objc_msgSend(v54, "setMonth:", 12);
      objc_msgSend(v55, "setYear:", 1);
      v40 = 8;
      objc_msgSend(v10, "setMonth:", 8);
      objc_msgSend(v11, "setMonth:", 2);
      goto LABEL_16;
    case 3:
      -[NSDateComponents setWeekOfYear:](v5, "setWeekOfYear:", 26);
      -[NSDateComponents setMonth:](v8, "setMonth:", 1);
      -[NSDateComponents setWeekOfYear:](v6, "setWeekOfYear:", 1);
      -[NSDateComponents setWeekOfYear:](v7, "setWeekOfYear:", 1);
      -[NSDateComponents setMonth:](v9, "setMonth:", 1);
      objc_msgSend(v54, "setWeekOfYear:", 39);
      objc_msgSend(v55, "setWeekOfYear:", 26);
      objc_msgSend(v10, "setWeekOfYear:", 20);
      objc_msgSend(v11, "setWeekOfYear:", 1);
      v14 = 0x2000;
      goto LABEL_15;
    case 4:
      -[NSDateComponents setMonth:](v5, "setMonth:", 1);
      -[NSDateComponents setWeekOfYear:](v8, "setWeekOfYear:", 1);
      -[NSDateComponents setDay:](v6, "setDay:", 1);
      -[NSDateComponents setDay:](v7, "setDay:", 1);
      -[NSDateComponents setWeekOfYear:](v9, "setWeekOfYear:", 1);
      objc_msgSend(v54, "setDay:", 45);
      objc_msgSend(v55, "setMonth:", 1);
      objc_msgSend(v10, "setDay:", 8);
      v15 = v11;
      v16 = 4;
      goto LABEL_11;
    case 5:
      -[NSDateComponents setWeekOfYear:](v5, "setWeekOfYear:", 1);
      -[NSDateComponents setDay:](v8, "setDay:", 1);
      -[NSDateComponents setDay:](v6, "setDay:", 1);
      -[NSDateComponents setHour:](v7, "setHour:", 6);
      -[NSDateComponents setDay:](v9, "setDay:", 1);
      objc_msgSend(v54, "setDay:", 14);
      objc_msgSend(v55, "setWeekOfYear:", 1);
      objc_msgSend(v10, "setHour:", 84);
      v15 = v11;
      v16 = 1;
LABEL_11:
      objc_msgSend(v15, "setDay:", v16);
      goto LABEL_12;
    case 6:
      -[NSDateComponents setDay:](v5, "setDay:", 1);
      -[NSDateComponents setHour:](v8, "setHour:", 6);
      -[NSDateComponents setHour:](v9, "setHour:", 6);
      -[NSDateComponents setHour:](v6, "setHour:", 1);
      -[NSDateComponents setHour:](v7, "setHour:", 1);
      objc_msgSend(v54, "setDay:", 4);
      objc_msgSend(v55, "setDay:", 1);
      objc_msgSend(v10, "setHour:", 12);
      objc_msgSend(v11, "setHour:", 2);
      v14 = 32;
      goto LABEL_15;
    case 7:
      -[NSDateComponents setHour:](v5, "setHour:", 1);
      -[NSDateComponents setMinute:](v8, "setMinute:", 15);
      -[NSDateComponents setMinute:](v9, "setMinute:", 15);
      -[NSDateComponents setMinute:](v6, "setMinute:", 2);
      -[NSDateComponents setMinute:](v7, "setMinute:", 2);
      objc_msgSend(v54, "setHour:", 12);
      objc_msgSend(v55, "setHour:", 1);
      objc_msgSend(v10, "setMinute:", 30);
      objc_msgSend(v11, "setMinute:", 15);
      v14 = 64;
      goto LABEL_15;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = a1;
      objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCoordinateTransform.m"), 330, CFSTR("Invalid zoom level (%ld)"), 8);

      v40 = 16;
      goto LABEL_17;
    default:
LABEL_12:
      v14 = 16;
LABEL_15:
      v40 = v14;
LABEL_16:
      v17 = a1;
LABEL_17:
      objc_msgSend(v17, "defaultCalendar");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateByAddingComponents:toDate:options:", v54, v19, 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v10;
      objc_msgSend(v18, "dateByAddingComponents:toDate:options:", v10, v19, 0);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateByAddingComponents:toDate:options:", v55, v19, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateByAddingComponents:toDate:options:", v6, v19, 0);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateByAddingComponents:toDate:options:", v7, v19, 0);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateByAddingComponents:toDate:options:", v11, v19, 0);
      v53 = v11;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dateByAddingComponents:toDate:options:", v8, v19, 0);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v8;
      v21 = objc_alloc_init(HKGraphZoomLevelConfiguration);
      referencePointIntervalComponents = v21->_referencePointIntervalComponents;
      v21->_referencePointIntervalComponents = v5;
      v23 = v5;

      seriesPointStandardIntervalComponents = v21->_seriesPointStandardIntervalComponents;
      v21->_seriesPointStandardIntervalComponents = v6;
      v41 = v6;

      seriesPointEnhancedIntervalComponents = v21->_seriesPointEnhancedIntervalComponents;
      v21->_seriesPointEnhancedIntervalComponents = v7;
      v26 = v7;

      axisLabelIntervalComponents = v21->_axisLabelIntervalComponents;
      v21->_axisLabelIntervalComponents = v20;
      v28 = v20;

      minorAxisIntervalComponents = v21->_minorAxisIntervalComponents;
      v21->_minorAxisIntervalComponents = v50;

      objc_msgSend(v49, "timeIntervalSinceReferenceDate");
      v21->_seriesBlockSize = v30;
      objc_msgSend(v48, "timeIntervalSinceReferenceDate");
      v21->_zoomLevelThreshold = v31;
      objc_msgSend(v46, "timeIntervalSinceReferenceDate");
      v21->_canonicalSize = v32;
      v21->_majorTickCalendarUnit = v40;
      objc_msgSend(v45, "timeIntervalSinceReferenceDate");
      v21->_approximateSeriesStandardPointInterval = v33;
      objc_msgSend(v44, "timeIntervalSinceReferenceDate");
      v21->_approximateSeriesEnhancedPointInterval = v34;
      objc_msgSend(v43, "timeIntervalSinceReferenceDate");
      v21->_todayOffsetSize = v35;
      objc_msgSend(v42, "timeIntervalSinceReferenceDate");
      v21->_approximateAxisLabelInterval = v36;
      v21->_intendedTimeScope = v51;

      return v21;
  }
}

+ (id)configurationForZoomLevel:(int64_t)a3
{
  void *v5;
  void *v6;

  if (configurationForZoomLevel__onceToken != -1)
    dispatch_once(&configurationForZoomLevel__onceToken, &__block_literal_global_67);
  os_unfair_lock_lock((os_unfair_lock_t)&configurationForZoomLevel__configurationLock);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)configurationForZoomLevel____configurations, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(a1, "_generateConfigurationForZoomLevel:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)configurationForZoomLevel____configurations, "setObject:forKeyedSubscript:", v6, v5);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&configurationForZoomLevel__configurationLock);

  return v6;
}

void __59__HKGraphZoomLevelConfiguration_configurationForZoomLevel___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)configurationForZoomLevel____configurations;
  configurationForZoomLevel____configurations = v0;

}

+ (id)defaultCalendar
{
  if (defaultCalendar_onceToken != -1)
    dispatch_once(&defaultCalendar_onceToken, &__block_literal_global_284);
  return (id)defaultCalendar___calendar;
}

void __48__HKGraphZoomLevelConfiguration_defaultCalendar__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)defaultCalendar___calendar;
  defaultCalendar___calendar = v0;

}

+ (int64_t)timeScopeForDateRange:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;

  v4 = a3;
  objc_msgSend(v4, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v7 = v6;
  objc_msgSend(v4, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v7 - v9;

  if (v10 <= 3600.0)
  {
    v16 = 7;
  }
  else if (v10 <= 86400.0)
  {
    v16 = 6;
  }
  else if (v10 <= 604800.0)
  {
    v16 = 5;
  }
  else
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setMonth:", -1);
    objc_msgSend(a1, "defaultCalendar");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dateByAddingComponents:toDate:options:", v11, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = objc_msgSend(v14, "hk_isBeforeOrEqualToDate:", v15);

    if ((v13 & 1) != 0)
    {
      v16 = 4;
    }
    else
    {
      objc_msgSend(v11, "setMonth:", -6);
      objc_msgSend(a1, "defaultCalendar");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "endDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dateByAddingComponents:toDate:options:", v11, v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "startDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "hk_isBeforeOrEqualToDate:", v20);

      if (v21)
        v16 = 3;
      else
        v16 = 2;
      v14 = v19;
    }

  }
  return v16;
}

+ (id)_gregorianCalendarForCalendar:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "calendarIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0C996C8]))
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(a1, "defaultCalendar");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

+ (id)_findVisibleRangeForTimeScope:(int64_t)a3 anchorDate:(id)a4 alignment:(int64_t)a5 calendar:(id)a6 anchorDateIsInclusive:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v7 = a7;
  v12 = a4;
  v13 = a6;
  switch(a5)
  {
    case 0:
    case 3:
      objc_msgSend(a1, "_visibleRangeDateFromAnchor:timeScope:calendar:offset:", v12, a3, v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 1:
      objc_msgSend(a1, "_dateOffsetByHalfCanonicalSizeOfDate:timeScope:", v12, a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_visibleRangeDateFromAnchor:timeScope:calendar:offset:", v15, a3, v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_4:
      objc_msgSend(a1, "_visibleRangeDateFromDate:timeScope:calendar:offset:", v14, a3, v13, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(a1, "_visibleRangeDateFromAnchor:timeScope:calendar:offset:", v12, a3, v13, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v16, "hk_isBeforeDate:", v12) & 1) != 0
        || v7 && objc_msgSend(v16, "hk_isBeforeOrEqualToDate:", v12))
      {
        if (a3 == 3)
          objc_msgSend(v13, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v13, "firstWeekday"), v12, 1);
        else
          objc_msgSend(a1, "_visibleRangeDateFromAnchor:timeScope:calendar:offset:", v12, a3, v13, 1);
        v20 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v20;
      }
      objc_msgSend(a1, "_visibleRangeDateFromDate:timeScope:calendar:offset:", v16, a3, v13, -1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(a1, "_visibleRangeDateFromAnchor:timeScope:calendar:offset:", v12, a3, v13, 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_visibleRangeDateFromDate:timeScope:calendar:offset:", v17, a3, v13, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_gregorianCalendarForCalendar:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hk_sleepDayStartWithCalendar:", v19);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "hk_sleepDayStartWithCalendar:", v19);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v16 = 0;
      v14 = 0;
      break;
  }
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v14, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)_visibleRangeDateFromAnchor:(id)a3 timeScope:(int64_t)a4 calendar:(id)a5 offset:(int64_t)a6
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;

  v11 = a3;
  v12 = a5;
  v13 = v12;
  switch(a4)
  {
    case 0:
    case 1:
      objc_msgSend(v12, "hk_startOfYearForDate:addingYears:", v11, a6);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      objc_msgSend(v12, "hk_startOfMonthForDate:addingMonths:", v11, a6);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      objc_msgSend(v12, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v12, "firstWeekday"), v11, 26 * a6);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
    case 5:
      objc_msgSend(v12, "hk_startOfDateByAddingDays:toDate:", a6, v11);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 6:
      objc_msgSend(v12, "hk_startOfHourForDate:addingHours:", v11, a6);
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v15 = (void *)v14;
      goto LABEL_11;
    case 7:
      +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", 7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "axisLabelIntervalComponents");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "minute");

      objc_msgSend(v13, "hk_startOfMinuteForDate:moduloMinutes:addingModuloCount:", v11, v18, a6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_11;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCoordinateTransform.m"), 616, CFSTR("Invalid zoom level (%ld)"), 8);

      goto LABEL_10;
    default:
LABEL_10:
      v15 = 0;
LABEL_11:

      return v15;
  }
}

+ (id)_visibleRangeDateFromDate:(id)a3 timeScope:(int64_t)a4 calendar:(id)a5 offset:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a5;
  v11 = a3;
  objc_msgSend(a1, "_axisSpanDateComponentsWithTimeScope:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setCalendar:", v10);

  objc_msgSend(v12, "hk_dateByAddingInterval:toDate:", a6, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)_dateOffsetByHalfCanonicalSizeOfDate:(id)a3 timeScope:(int64_t)a4
{
  id v5;
  void *v6;
  double v7;
  void *v8;

  v5 = a3;
  +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "canonicalSize");
  objc_msgSend(v5, "dateByAddingTimeInterval:", v7 * -0.5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_fitRange:(id)a3 toDateRange:(id)a4 timeScope:(int64_t)a5 alignment:(int64_t)a6 calendar:(id)a7 firstWeekday:(int64_t)a8 cadence:(int64_t)a9 level:(int64_t)a10
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL4 v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  os_log_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  const __CFString *v45;
  void *v46;
  const __CFString *v47;
  void *v48;
  void *v49;
  void *v50;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  os_log_t v64;
  os_log_t v65;
  NSObject *v66;
  NSObject *v68;
  os_log_t v69;
  void *v70;
  void *v71;
  void *v72;
  os_log_t log;
  NSObject *loga;
  uint8_t buf[4];
  os_log_t v76;
  __int16 v77;
  void *v78;
  __int16 v79;
  void *v80;
  __int16 v81;
  uint64_t v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  const __CFString *v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a7;
  objc_msgSend(v14, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v14;
  objc_msgSend(v14, "endDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startDate");
  v20 = objc_claimAutoreleasedReturnValue();
  v70 = v15;
  objc_msgSend(v15, "endDate");
  v21 = objc_claimAutoreleasedReturnValue();
  v23 = a5 == 6 && a6 == 4;
  v72 = v17;
  log = (os_log_t)v20;
  v24 = v20;
  v25 = v21;
  v26 = objc_msgSend(v17, "compare:", v24);
  v71 = v19;
  v27 = objc_msgSend(v19, "compare:", v25);
  if (v26 == -1)
  {
    if (v27 == 1)
    {
      HKStringForHKTimeScope(a5, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v18;
      if ((unint64_t)(a6 - 1) > 3)
        v38 = CFSTR("left");
      else
        v38 = off_1E9C44828[a6 - 1];
      v29 = v16;
      v36 = v70;
      v32 = log;
      _HKInitializeLogging();
      v48 = (void *)*MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_FAULT))
      {
        loga = v48;
        objc_msgSend(v34, "startDate");
        v52 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "endDate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "startDate");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "endDate");
        v65 = v25;
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v76 = v52;
        v77 = 2114;
        v78 = v53;
        v79 = 2114;
        v80 = v54;
        v81 = 2114;
        v82 = (uint64_t)v55;
        v83 = 2114;
        v84 = v37;
        v85 = 2114;
        v86 = v38;
        _os_log_fault_impl(&dword_1D7813000, loga, OS_LOG_TYPE_FAULT, "charting: _fitRange span too large: fit range %{public}@ to %{public}@ into %{public}@ to %{public}@ time scope %{public}@ alignment %{public}@", buf, 0x3Eu);

        v25 = v65;
      }
      v35 = v70;

    }
    else
    {
      if (v23)
        v39 = 4;
      else
        v39 = 0;
      LOBYTE(v62) = 1;
      v32 = log;
      v29 = v16;
      +[HKGraphZoomLevelConfiguration _chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:anchorDateIsInclusive:](HKGraphZoomLevelConfiguration, "_chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:anchorDateIsInclusive:", a5, log, v39, 0, v16, a8, a9, a10 + 1, v62);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "endDate");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v25;
      v43 = objc_msgSend(v41, "compare:", v25);

      v34 = v18;
      if (v43 == 1)
      {
        HKStringForHKTimeScope(a5, 0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = v70;
        if ((unint64_t)(a6 - 1) > 3)
          v45 = CFSTR("left");
        else
          v45 = off_1E9C44828[a6 - 1];
        v25 = v42;
        _HKInitializeLogging();
        v50 = (void *)*MEMORY[0x1E0CB5378];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
        {
          v66 = v50;
          objc_msgSend(v34, "startDate");
          v69 = (os_log_t)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "endDate");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "startDate");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "endDate");
          *(_DWORD *)buf = 138544642;
          v76 = v69;
          v77 = 2114;
          v78 = v63;
          v79 = 2114;
          v80 = v60;
          v81 = 2114;
          v82 = objc_claimAutoreleasedReturnValue();
          v61 = (void *)v82;
          v83 = 2114;
          v84 = v44;
          v85 = 2114;
          v86 = v45;
          _os_log_error_impl(&dword_1D7813000, v66, OS_LOG_TYPE_ERROR, "charting: _fitRange jitter detected: fit range %{public}@ to %{public}@ into %{public}@ to %{public}@ time scope %{public}@ alignment %{public}@", buf, 0x3Eu);

          v25 = v42;
        }
        v35 = v70;

      }
      else
      {
        v35 = v40;
        v36 = v70;
        v25 = v42;
      }

    }
  }
  else if (v27 == 1)
  {
    if (v23)
      v28 = 4;
    else
      v28 = 2;
    LOBYTE(v62) = 0;
    v64 = v25;
    v29 = v16;
    +[HKGraphZoomLevelConfiguration _chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:anchorDateIsInclusive:](HKGraphZoomLevelConfiguration, "_chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:anchorDateIsInclusive:", a5, v25, v28, 0, v16, a8, a9, a10 + 1, v62);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "startDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = log;
    v33 = objc_msgSend(v31, "compare:", log);

    v34 = v18;
    if (v33 == -1)
    {
      HKStringForHKTimeScope(a5, 0);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v70;
      if ((unint64_t)(a6 - 1) > 3)
        v47 = CFSTR("left");
      else
        v47 = off_1E9C44828[a6 - 1];
      _HKInitializeLogging();
      v49 = (void *)*MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      {
        v68 = v49;
        objc_msgSend(v34, "startDate");
        v56 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "endDate");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "startDate");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "endDate");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v76 = v56;
        v77 = 2114;
        v78 = v57;
        v79 = 2114;
        v80 = v58;
        v81 = 2114;
        v82 = (uint64_t)v59;
        v83 = 2114;
        v84 = v46;
        v85 = 2114;
        v86 = v47;
        _os_log_error_impl(&dword_1D7813000, v68, OS_LOG_TYPE_ERROR, "charting: _fitRange jitter detected: fit range %{public}@ to %{public}@ into %{public}@ to %{public}@ time scope %{public}@ alignment %{public}@", buf, 0x3Eu);

      }
      v35 = v70;

      v32 = log;
    }
    else
    {
      v35 = v30;
      v36 = v70;
    }

    v25 = v64;
  }
  else
  {
    v34 = v18;
    v35 = v18;
    v29 = v16;
    v36 = v70;
    v32 = log;
  }

  return v35;
}

+ (id)chartVisibleRangeForTimeScope:(int64_t)a3 anchorDate:(id)a4 alignment:(int64_t)a5 dataRange:(id)a6 calendar:(id)a7 firstWeekday:(int64_t)a8 cadence:(int64_t)a9 level:(int64_t)a10
{
  uint64_t v11;

  LOBYTE(v11) = 1;
  return (id)objc_msgSend(a1, "_chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:anchorDateIsInclusive:", a3, a4, a5, a6, a7, a8, a9, a10, v11);
}

+ (id)_chartVisibleRangeForTimeScope:(int64_t)a3 anchorDate:(id)a4 alignment:(int64_t)a5 dataRange:(id)a6 calendar:(id)a7 firstWeekday:(int64_t)a8 cadence:(int64_t)a9 level:(int64_t)a10 anchorDateIsInclusive:(BOOL)a11
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  NSObject *v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v17 = a6;
  v18 = a7;
  if (v16)
  {
    v19 = v16;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  v20 = v19;
  if ((unint64_t)(a5 - 3) <= 1)
  {
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v19, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKGraphZoomLevelConfiguration chartDataRangeForTimeScope:dataRange:firstWeekday:calendar:cadence:alignment:](HKGraphZoomLevelConfiguration, "chartDataRangeForTimeScope:dataRange:firstWeekday:calendar:cadence:alignment:", a3, v21, a8, v18, a9, a5);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      goto LABEL_6;
LABEL_9:
    v23 = v22;
    goto LABEL_10;
  }
  objc_msgSend(a1, "_findVisibleRangeForTimeScope:anchorDate:alignment:calendar:anchorDateIsInclusive:", a3, v19, a5, v18, a11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_9;
LABEL_6:
  if (a10 <= 2)
  {
    +[HKGraphZoomLevelConfiguration _fitRange:toDateRange:timeScope:alignment:calendar:firstWeekday:cadence:level:](HKGraphZoomLevelConfiguration, "_fitRange:toDateRange:timeScope:alignment:calendar:firstWeekday:cadence:level:", v22, v17, a3, a5, v18, a8, a9, a10);
    v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v24 = v23;
    goto LABEL_17;
  }
  HKStringForHKTimeScope(a3, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)(a5 - 1) > 3)
    v26 = CFSTR("left");
  else
    v26 = off_1E9C44828[a5 - 1];
  _HKInitializeLogging();
  v27 = (void *)*MEMORY[0x1E0CB5378];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_FAULT))
  {
    v29 = v27;
    objc_msgSend(v17, "startDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "endDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v34 = v20;
    v35 = 2114;
    v36 = v30;
    v37 = 2114;
    v38 = v31;
    v39 = 2114;
    v40 = v25;
    v41 = 2114;
    v42 = v26;
    _os_log_fault_impl(&dword_1D7813000, v29, OS_LOG_TYPE_FAULT, "chartVisibleRangeError: unable to fit anchor %{public}@ into data range %{public}@ to %{public}@ with time scope %{public}@ and alignment %{public}@", buf, 0x34u);

  }
  v24 = v22;

LABEL_17:
  return v24;
}

+ (id)snappingRangeForRange:(id)a3 axisRange:(id)a4 timeScope:(int64_t)a5 velocity:(CGPoint)a6 calendar:(id)a7 options:(int64_t)a8 alignment:(int64_t)a9
{
  double y;
  double x;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 IsSmaller;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;

  y = a6.y;
  x = a6.x;
  v17 = a4;
  v18 = a7;
  objc_msgSend(a3, "startDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_snappingStartDateWithStartDate:velocity:calendar:timeScope:options:alignment:", v19, v18, a5, a8, a9, x, y);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "startDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v19) = HKUIObjectIsSmaller(v20, (uint64_t)v21);

  if ((_DWORD)v19)
  {
    objc_msgSend(v17, "startDate");
    v22 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v22;
  }
  objc_msgSend(a1, "_axisSpanDateComponentsWithTimeScope:", a5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setCalendar:", v18);
  objc_msgSend(v23, "hk_dateByAddingInterval:toDate:", 1, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "endDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  IsSmaller = HKUIObjectIsSmaller(v25, (uint64_t)v24);

  if (IsSmaller)
  {
    objc_msgSend(v17, "endDate");
    v27 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v23, "hk_dateByAddingInterval:toDate:", -1, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startDate");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIObjectMax(v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v30;
    v24 = (void *)v27;
  }
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v20, v24);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (id)activeRangeFromCadenceRange:(id)a3 timeScope:(int64_t)a4 axisRange:(id)a5 calendar:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v9 = a3;
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKGraphZoomLevelConfiguration chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:](HKGraphZoomLevelConfiguration, "chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:", a4, v12, 3, v11, v10, objc_msgSend(v10, "firstWeekday"), 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "compare:", v15);

  if (v16)
    v17 = v9;
  else
    v17 = v13;
  v18 = v17;

  return v18;
}

+ (id)_snappingStartDateWithStartDate:(id)a3 velocity:(CGPoint)a4 calendar:(id)a5 timeScope:(int64_t)a6 options:(int64_t)a7 alignment:(int64_t)a8
{
  unsigned __int8 v9;
  double x;
  id v14;
  id v15;
  double v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  id v53;

  v9 = a7;
  x = a4.x;
  v14 = a3;
  v15 = a5;
  v16 = fabs(x);
  v17 = x > 0.0;
  v18 = v14;
  v19 = v18;
  if (v16 >= 0.3)
  {
    if (v16 <= 3.2)
      v25 = 0;
    else
      v25 = -1;
    if (v16 <= 3.2)
      v26 = 1;
    else
      v26 = 2;
    v20 = v18;
    v21 = v18;
    switch(a6)
    {
      case 0:
        v40 = v16 > 3.2;
        if (v16 <= 3.2)
          v41 = 0;
        else
          v41 = -10;
        objc_msgSend(v15, "hk_startOfYearForDate:addingYears:", v18, v41);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = 10;
        goto LABEL_27;
      case 1:
        v40 = v16 > 3.2;
        if (v16 <= 3.2)
          v43 = 0;
        else
          v43 = -5;
        objc_msgSend(v15, "hk_startOfYearForDate:addingYears:", v18, v43);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = 5;
LABEL_27:
        v24 = v42 << v40;
        v22 = v15;
        v23 = v19;
        goto LABEL_29;
      case 2:
        objc_msgSend(v15, "hk_startOfYearForDate:addingYears:", v18, v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = v15;
        v23 = v19;
        v24 = v26;
LABEL_29:
        objc_msgSend(v22, "hk_startOfYearForDate:addingYears:", v23, v24);
        v31 = objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      case 3:
      case 5:
        objc_msgSend(v15, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v15, "firstWeekday"), v18, v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_msgSend(v15, "firstWeekday");
        v28 = v15;
        v29 = v19;
        v30 = v26;
LABEL_15:
        objc_msgSend(v28, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", v27, v29, v30);
        v31 = objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      case 4:
        objc_msgSend(v15, "hk_startOfMonthForDate:addingMonths:", v18, v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = v15;
        v33 = v19;
        v34 = v26;
LABEL_31:
        objc_msgSend(v32, "hk_startOfMonthForDate:addingMonths:", v33, v34);
        v31 = objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      case 6:
        objc_msgSend(v15, "hk_startOfDateByAddingDays:toDate:", v25, v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = v15;
        v36 = v26;
LABEL_33:
        objc_msgSend(v35, "hk_startOfDateByAddingDays:toDate:", v36, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (a8 != 4)
          goto LABEL_40;
        objc_msgSend(a1, "_gregorianCalendarForCalendar:", v15);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "hk_sleepDayStartWithCalendar:", v37);
        v44 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "hk_sleepDayStartWithCalendar:", v37);
        v45 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v45;
        v21 = (void *)v44;
        break;
      case 7:
        objc_msgSend(v15, "hk_startOfHourForDate:addingHours:", v18, v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = v15;
        v47 = v19;
        v48 = v26;
        goto LABEL_37;
      default:
        goto LABEL_40;
    }
  }
  else
  {
    v20 = v18;
    v21 = v18;
    switch(a6)
    {
      case 0:
      case 1:
        objc_msgSend(v15, "hk_startOfYearForDate:addingYears:", v18, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v22 = v15;
        v23 = v19;
        v24 = 1;
        goto LABEL_29;
      case 2:
        objc_msgSend(v15, "hk_startOfMonthForDate:addingMonths:", v18, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v32 = v15;
        v33 = v19;
        v34 = 1;
        goto LABEL_31;
      case 3:
        objc_msgSend(v15, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v15, "firstWeekday"), v18, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_msgSend(v15, "firstWeekday");
        v28 = v15;
        v29 = v19;
        v30 = 1;
        goto LABEL_15;
      case 4:
      case 5:
        objc_msgSend(v15, "hk_startOfDateByAddingDays:toDate:", 0, v18);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "hk_startOfDateByAddingDays:toDate:", 1, v19);
        v31 = objc_claimAutoreleasedReturnValue();
        goto LABEL_38;
      case 6:
        if (((a6 == 6) & v9) != 0)
        {
          objc_msgSend(v15, "hk_startOfDateByAddingDays:toDate:", 0, v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v35 = v15;
          v36 = 1;
          goto LABEL_33;
        }
        objc_msgSend(v15, "hk_startOfHourForDate:addingHours:", v18, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v46 = v15;
        v47 = v19;
        v48 = 1;
        break;
      case 7:
        +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", 7);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "axisLabelIntervalComponents");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = objc_msgSend(v38, "minute");

        objc_msgSend(v15, "hk_startOfMinuteForDate:moduloMinutes:addingModuloCount:", v19, v39, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "hk_startOfMinuteForDate:moduloMinutes:addingModuloCount:", v19, v39, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_39;
      default:
        goto LABEL_40;
    }
LABEL_37:
    objc_msgSend(v46, "hk_startOfHourForDate:addingHours:", v47, v48);
    v31 = objc_claimAutoreleasedReturnValue();
LABEL_38:
    v20 = (void *)v31;
    v37 = v19;
  }
LABEL_39:

LABEL_40:
  if (v16 < 2.22044605e-16)
  {
    objc_msgSend(v19, "timeIntervalSinceDate:", v21);
    v50 = v49;
    objc_msgSend(v20, "timeIntervalSinceDate:", v19);
    v17 = v51 < v50;
  }
  if (v17)
    v52 = v20;
  else
    v52 = v21;
  v53 = v52;

  return v53;
}

+ (id)_axisSpanDateComponentsWithTimeScope:(int64_t)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v5 = v4;
  switch(a3)
  {
    case 0:
      v6 = 10;
      goto LABEL_5;
    case 1:
      v6 = 5;
      goto LABEL_5;
    case 2:
      v6 = 1;
LABEL_5:
      objc_msgSend(v4, "setYear:", v6);
      return v5;
    case 3:
      v7 = 26;
      goto LABEL_9;
    case 4:
      v8 = 31;
      goto LABEL_11;
    case 5:
      v7 = 1;
LABEL_9:
      objc_msgSend(v4, "setWeekOfYear:", v7);
      break;
    case 6:
      v8 = 1;
LABEL_11:
      objc_msgSend(v4, "setDay:", v8);
      break;
    case 7:
      objc_msgSend(v4, "setHour:", 1);
      break;
    default:
      return v5;
  }
  return v5;
}

+ (id)seriesPointIntervalUnitForTimeScope:(int64_t)a3 pointCount:(int64_t)a4
{
  __CFString *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = &stru_1E9C4C428;
  switch(a3)
  {
    case 0:
    case 1:
      v6 = CFSTR("YEARS_NUMBERED_UNIT");
      goto LABEL_9;
    case 2:
      v6 = CFSTR("MONTHS_NUMBERED_UNIT");
      goto LABEL_9;
    case 3:
      v6 = CFSTR("WEEKS_NUMBERED_UNIT");
      goto LABEL_9;
    case 4:
    case 5:
      v6 = CFSTR("DAYS_NUMBERED_UNIT");
      goto LABEL_9;
    case 6:
      v6 = CFSTR("HOURS_NUMBERED_UNIT");
      goto LABEL_9;
    case 7:
      v6 = CFSTR("MINUTES_NUMBERED_UNIT");
      goto LABEL_9;
    case 8:
      return v5;
    default:
      v6 = 0;
LABEL_9:
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", v6, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v9, a4);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

      return v5;
  }
}

+ (int64_t)visibleSeriesPointCountForTimeScope:(int64_t)a3 resolution:(int64_t)a4
{
  void *v5;
  int64_t v6;

  objc_msgSend(a1, "configurationForZoomLevel:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "visibleSeriesPointCountAtResolution:", a4);

  return v6;
}

- (int64_t)visibleSeriesPointCountAtResolution:(int64_t)a3
{
  double v5;
  double v6;
  void *v7;
  double v8;
  int64_t v9;

  -[HKGraphZoomLevelConfiguration canonicalSize](self, "canonicalSize");
  v6 = v5;
  -[HKGraphZoomLevelConfiguration seriesPointIntervalComponentsAtResolution:](self, "seriesPointIntervalComponentsAtResolution:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_approximateDuration");
  v9 = vcvtmd_s64_f64(v6 / fmax(v8, 1.0));

  return v9;
}

- (id)seriesPointIntervalComponentsAtResolution:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
    a2 = (SEL)*(id *)((char *)&self->super.isa + qword_1D7B82370[a3]);
  return (id)(id)a2;
}

- (double)approximateSeriesPointIntervalAtResolution:(int64_t)a3
{
  double result;

  if ((unint64_t)a3 <= 2)
    return *(double *)((char *)&self->super.isa + qword_1D7B82388[a3]);
  return result;
}

- (NSDateComponents)axisLabelIntervalComponents
{
  return self->_axisLabelIntervalComponents;
}

- (NSDateComponents)minorAxisIntervalComponents
{
  return self->_minorAxisIntervalComponents;
}

- (NSDateComponents)referencePointIntervalComponents
{
  return self->_referencePointIntervalComponents;
}

- (int64_t)intendedTimeScope
{
  return self->_intendedTimeScope;
}

- (double)seriesBlockSize
{
  return self->_seriesBlockSize;
}

- (double)zoomLevelThreshold
{
  return self->_zoomLevelThreshold;
}

- (double)canonicalSize
{
  return self->_canonicalSize;
}

- (unint64_t)majorTickCalendarUnit
{
  return self->_majorTickCalendarUnit;
}

- (double)todayOffsetSize
{
  return self->_todayOffsetSize;
}

- (double)approximateAxisLabelInterval
{
  return self->_approximateAxisLabelInterval;
}

- (NSDateComponents)seriesPointStandardIntervalComponents
{
  return self->_seriesPointStandardIntervalComponents;
}

- (NSDateComponents)seriesPointEnhancedIntervalComponents
{
  return self->_seriesPointEnhancedIntervalComponents;
}

- (double)approximateSeriesStandardPointInterval
{
  return self->_approximateSeriesStandardPointInterval;
}

- (double)approximateSeriesEnhancedPointInterval
{
  return self->_approximateSeriesEnhancedPointInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesPointEnhancedIntervalComponents, 0);
  objc_storeStrong((id *)&self->_seriesPointStandardIntervalComponents, 0);
  objc_storeStrong((id *)&self->_referencePointIntervalComponents, 0);
  objc_storeStrong((id *)&self->_minorAxisIntervalComponents, 0);
  objc_storeStrong((id *)&self->_axisLabelIntervalComponents, 0);
}

@end
