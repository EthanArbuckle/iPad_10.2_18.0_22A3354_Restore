@implementation RTElevation

- (RTElevation)initWithElevation:(double)a3 dateInterval:(id)a4
{
  return -[RTElevation initWithElevation:dateInterval:elevationUncertainty:estimationStatus:](self, "initWithElevation:dateInterval:elevationUncertainty:estimationStatus:", a4, 0, a3, 50.0);
}

- (RTElevation)initWithElevation:(double)a3 dateInterval:(id)a4 elevationUncertainty:(double)a5 estimationStatus:(int64_t)a6
{
  id v10;
  RTElevation *v11;
  RTElevation *v12;
  uint64_t v13;
  NSDate *startDate;
  uint64_t v15;
  NSDate *endDate;
  NSObject *v17;
  RTElevation *v18;
  NSObject *v19;
  objc_super v21;
  uint8_t buf[4];
  RTElevation *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  if (v10)
  {
    v21.receiver = self;
    v21.super_class = (Class)RTElevation;
    v11 = -[RTElevation init](&v21, sel_init);
    v12 = v11;
    if (v11)
    {
      v11->_elevation = a3;
      objc_msgSend(v10, "startDate");
      v13 = objc_claimAutoreleasedReturnValue();
      startDate = v12->_startDate;
      v12->_startDate = (NSDate *)v13;

      objc_msgSend(v10, "endDate");
      v15 = objc_claimAutoreleasedReturnValue();
      endDate = v12->_endDate;
      v12->_endDate = (NSDate *)v15;

      v12->_elevationUncertainty = a5;
      v12->_estimationStatus = a6;
    }
    _rt_log_facility_get_os_log(RTLogFacilityElevation);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v23 = v12;
      _os_log_debug_impl(&dword_1A5E26000, v17, OS_LOG_TYPE_DEBUG, "elevation, %@", buf, 0xCu);
    }

    self = v12;
    v18 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1A5E26000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: dateInterval", buf, 2u);
    }

    v18 = 0;
  }

  return v18;
}

- (BOOL)isValid
{
  double v3;
  double v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  double v18;
  BOOL v19;
  double v20;

  -[RTElevation elevation](self, "elevation");
  if (v3 <= -1000.0)
  {
    v5 = 1;
  }
  else
  {
    -[RTElevation elevation](self, "elevation");
    v5 = v4 >= 10000.0;
  }
  -[RTElevation startDate](self, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604801.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "compare:", v7) == 1)
  {
    -[RTElevation startDate](self, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "compare:", v9) == -1)
    {
      -[RTElevation startDate](self, "startDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTElevation endDate](self, "endDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "compare:", v12) == -1;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  -[RTElevation endDate](self, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -604801.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "compare:", v14) == 1)
  {
    -[RTElevation endDate](self, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 1.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "compare:", v16) == -1;

  }
  else
  {
    v17 = 0;
  }

  -[RTElevation elevationUncertainty](self, "elevationUncertainty");
  if (v18 >= 0.0)
  {
    -[RTElevation elevationUncertainty](self, "elevationUncertainty");
    v19 = v20 <= 50.0;
  }
  else
  {
    v19 = 0;
  }
  return !v5 && v10 && v17 && v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (RTElevation)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  RTElevation *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("elevation"));
  v6 = v5;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("elevationUncertainty"));
  v10 = v9;
  v11 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("estimationStatus"));

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v8);
  v13 = -[RTElevation initWithElevation:dateInterval:elevationUncertainty:estimationStatus:](self, "initWithElevation:dateInterval:elevationUncertainty:estimationStatus:", v12, v11, v6, v10);

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  double elevation;
  id v5;

  elevation = self->_elevation;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("elevation"), elevation);
  objc_msgSend(v5, "encodeObject:forKey:", self->_startDate, CFSTR("startDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endDate, CFSTR("endDate"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("elevationUncertainty"), self->_elevationUncertainty);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_estimationStatus, CFSTR("estimationStatus"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", self->_startDate, self->_endDate);
  v6 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithElevation:dateInterval:elevationUncertainty:estimationStatus:", v5, self->_estimationStatus, self->_elevation, self->_elevationUncertainty);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  double elevation;
  double v7;
  double v8;
  NSDate *startDate;
  void *v10;
  char v11;
  NSDate *endDate;
  void *v13;
  char v14;
  double elevationUncertainty;
  double v16;
  double v17;
  int64_t estimationStatus;
  uint64_t v19;
  char v20;
  char v21;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class());
  elevation = self->_elevation;
  objc_msgSend(v4, "elevation");
  v8 = v7;
  startDate = self->_startDate;
  objc_msgSend(v4, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSDate isEqual:](startDate, "isEqual:", v10);

  endDate = self->_endDate;
  objc_msgSend(v4, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[NSDate isEqual:](endDate, "isEqual:", v13);

  elevationUncertainty = self->_elevationUncertainty;
  objc_msgSend(v4, "elevationUncertainty");
  v17 = v16;
  estimationStatus = self->_estimationStatus;
  v19 = objc_msgSend(v4, "estimationStatus");

  if (elevation == v8)
    v20 = v5;
  else
    v20 = 0;
  v21 = v20 & v11 & v14;
  if (elevationUncertainty != v17)
    v21 = 0;
  if (estimationStatus == v19)
    return v21;
  else
    return 0;
}

- (id)description
{
  void *v3;
  double elevation;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  elevation = self->_elevation;
  -[NSDate stringFromDate](self->_startDate, "stringFromDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDate stringFromDate](self->_endDate, "stringFromDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("elevation,%f,startDate,%@,endDate,%@,elevationUncertainty,%f,estimationStatus,%lu"), *(_QWORD *)&elevation, v5, v6, *(_QWORD *)&self->_elevationUncertainty, self->_estimationStatus);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (double)elevation
{
  return self->_elevation;
}

- (double)elevationUncertainty
{
  return self->_elevationUncertainty;
}

- (int64_t)estimationStatus
{
  return self->_estimationStatus;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
