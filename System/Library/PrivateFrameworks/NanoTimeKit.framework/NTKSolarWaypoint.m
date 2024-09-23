@implementation NTKSolarWaypoint

- (NTKSolarWaypoint)initWithType:(int64_t)a3 solarTimeModel:(id)a4
{
  id v7;
  NTKSolarWaypoint *v8;
  NTKSolarWaypoint *v9;
  NTKSolarWaypoint *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKSolarWaypoint;
  v8 = -[NTKSolarWaypoint init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong((id *)&v8->_solarTimeModel, a4);
    v10 = v9;
  }

  return v9;
}

- (void)updateDependentValues
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  NSDate *waypointDate;
  void *v8;
  double v9;
  double v11;
  float v12;
  float v13;
  NSDate *v14;
  NSDate *v15;
  id obj;

  switch(self->_type)
  {
    case 1:
      -[NTKSolarTimeModel localDawnDate](self->_solarTimeModel, "localDawnDate");
      v3 = objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[NTKSolarTimeModel localSunriseDate](self->_solarTimeModel, "localSunriseDate");
      v3 = objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      -[NTKSolarTimeModel localSolarNoonDate](self->_solarTimeModel, "localSolarNoonDate");
      v3 = objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      -[NTKSolarTimeModel localSunsetDate](self->_solarTimeModel, "localSunsetDate");
      v3 = objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      -[NTKSolarTimeModel localDuskDate](self->_solarTimeModel, "localDuskDate");
      v3 = objc_claimAutoreleasedReturnValue();
      break;
    default:
      -[NTKSolarTimeModel startDateForReferenceDate](self->_solarTimeModel, "startDateForReferenceDate");
      v3 = objc_claimAutoreleasedReturnValue();
      break;
  }
  obj = (id)v3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(obj, "isEqualToDate:", v4))
  {

LABEL_11:
    waypointDate = self->_waypointDate;
    self->_waypointDate = 0;

    self->_percentageThroughPeriodForWaypointDate = -1.0;
LABEL_12:
    v8 = obj;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "isEqualToDate:", v5);

  if (v6)
    goto LABEL_11;
  objc_storeStrong((id *)&self->_waypointDate, obj);
  -[NTKSolarTimeModel percentageThroughPeriodForDate:](self->_solarTimeModel, "percentageThroughPeriodForDate:", obj);
  v8 = obj;
  self->_percentageThroughPeriodForWaypointDate = v9;
  if (v9 < 0.0 || v9 > 1.0)
  {
    if (v9 >= 0.0 || v9 < -1.0)
    {
      if (v9 >= -1.0)
      {
        v13 = v9;
        v11 = fmodf(v13, 1.0);
      }
      else
      {
        v12 = v9;
        v11 = 1.0 - fmodf(-v12, 1.0);
      }
    }
    else
    {
      v11 = v9 + 1.0;
    }
    self->_percentageThroughPeriodForWaypointDate = v11;
    -[NTKSolarTimeModel dateForPercentageThroughPeriod:](self->_solarTimeModel, "dateForPercentageThroughPeriod:");
    v14 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v15 = self->_waypointDate;
    self->_waypointDate = v14;

    goto LABEL_12;
  }
LABEL_13:

}

- (void)updateDependentValuesWithPlaceholderData
{
  unint64_t v3;
  NSDate *v4;
  NSDate *waypointDate;
  NSDate *v6;
  double v7;
  double v8;

  v3 = self->_type - 1;
  if (v3 > 4)
  {
    v4 = 0;
  }
  else
  {
    -[NTKSolarTimeModel dateForPercentageThroughPeriod:](self->_solarTimeModel, "dateForPercentageThroughPeriod:", dbl_1B755E4D0[v3]);
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  waypointDate = self->_waypointDate;
  self->_waypointDate = v4;
  v6 = v4;

  -[NTKSolarTimeModel percentageThroughPeriodForDate:](self->_solarTimeModel, "percentageThroughPeriodForDate:", v6);
  v8 = v7;

  self->_percentageThroughPeriodForWaypointDate = v8;
}

- (NSString)localizedName
{
  NSString *localizedName;
  unint64_t v4;
  __CFString *v5;
  unint64_t v6;
  __CFString *v7;
  NSString *v8;
  NSString *v9;

  localizedName = self->_localizedName;
  if (!localizedName)
  {
    v4 = self->_type - 1;
    if (v4 > 4)
      v5 = CFSTR("SOLAR_CUSTOM");
    else
      v5 = off_1E6BD2700[v4];
    v6 = self->_type - 1;
    if (v6 > 4)
      v7 = CFSTR("SOLAR_CUSTOM");
    else
      v7 = off_1E6BD2700[v6];
    NTKClockFaceLocalizedString(v5, v7);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v9 = self->_localizedName;
    self->_localizedName = v8;

    localizedName = self->_localizedName;
  }
  return localizedName;
}

- (NSString)description
{
  void *v3;
  void *v4;
  NSDate *waypointDate;
  double percentageThroughPeriodForWaypointDate;
  void *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)NTKSolarWaypoint;
  -[NTKSolarWaypoint description](&v10, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  waypointDate = self->_waypointDate;
  percentageThroughPeriodForWaypointDate = self->_percentageThroughPeriodForWaypointDate;
  -[NTKSolarWaypoint localizedName](self, "localizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ date = (%@) percent = %.2f localizedName =\"%@\"), v4, waypointDate, *(_QWORD *)&percentageThroughPeriodForWaypointDate, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)ntkCacheableKey
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@:percent:%f-date:%@]"), v5, *(_QWORD *)&self->_percentageThroughPeriodForWaypointDate, self->_waypointDate);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)type
{
  return self->_type;
}

- (NTKSolarTimeModel)solarTimeModel
{
  return self->_solarTimeModel;
}

- (NSDate)waypointDate
{
  return self->_waypointDate;
}

- (double)percentageThroughPeriodForWaypointDate
{
  return self->_percentageThroughPeriodForWaypointDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_solarTimeModel, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_waypointDate, 0);
}

@end
