@implementation MOTimeTagInterval

- (MOTimeTagInterval)initWithTimeTag:(unint64_t)a3 dateInterval:(id)a4
{
  id v7;
  MOTimeTagInterval *v8;
  MOTimeTagInterval *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MOTimeTagInterval;
  v8 = -[MOTimeTagInterval init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_timetag = a3;
    objc_storeStrong((id *)&v8->_dateInterval, a4);
  }

  return v9;
}

- (double)overlapsScoreForStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  int v11;
  double v12;
  void *v14;
  double v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    -[MOTimeTagInterval dateInterval](self, "dateInterval");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "startDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOTimeTagInterval dateInterval](self, "dateInterval");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "endDate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 138413058;
    v36 = v6;
    v37 = 2112;
    v38 = v7;
    v39 = 2112;
    v40 = v28;
    v41 = 2112;
    v42 = v30;
    _os_log_debug_impl(&dword_1CAE42000, v8, OS_LOG_TYPE_DEBUG, "overlapsScoreForStartDate, startDate, %@, endDate, %@, self.startDate, %@, self.endDate, %@", (uint8_t *)&v35, 0x2Au);

  }
  if (!v7 || objc_msgSend(v6, "isEqualToDate:", v7))
    goto LABEL_9;
  if (objc_msgSend(v6, "isAfterDate:", v7))
  {
    _mo_log_facility_get_os_log(MOLogFacilityEventBundleManager);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[MOTimeTagInterval dateInterval](self, "dateInterval");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "startDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[MOTimeTagInterval dateInterval](self, "dateInterval");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "endDate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 138413058;
      v36 = v6;
      v37 = 2112;
      v38 = v7;
      v39 = 2112;
      v40 = v32;
      v41 = 2112;
      v42 = v34;
      _os_log_error_impl(&dword_1CAE42000, v9, OS_LOG_TYPE_ERROR, "overlapsScoreForStartDate, invalid time range, startDate, %@, endDate, %@, self.startDate, %@, self.endDate, %@", (uint8_t *)&v35, 0x2Au);

    }
LABEL_9:
    -[MOTimeTagInterval dateInterval](self, "dateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "containsDate:", v6);

    if (v11)
      v12 = 1.0;
    else
      v12 = 0.0;
    goto LABEL_12;
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v6, v7);
  objc_msgSend(v14, "duration");
  v12 = 0.0;
  if (v15 > 0.0)
  {
    -[MOTimeTagInterval dateInterval](self, "dateInterval");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "intersectsDateInterval:", v14);

    if (v17)
    {
      -[MOTimeTagInterval dateInterval](self, "dateInterval");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "intersectionWithDateInterval:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "duration");
      v21 = v20;

      objc_msgSend(v14, "duration");
      v23 = v22 - v21;
      objc_msgSend(v14, "duration");
      v25 = v21 / v24;
      if (v25 > 0.5 && v23 < 1800.0)
        v12 = 1.0;
      else
        v12 = v25;
    }
  }

LABEL_12:
  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  +[MOTime timeStringFromTimeTag:](MOTime, "timeStringFromTimeTag:", -[MOTimeTagInterval timetag](self, "timetag"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOTimeTagInterval dateInterval](self, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Interval: timetag, %@, interval, %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)timetag
{
  return self->_timetag;
}

- (void)setTimetag:(unint64_t)a3
{
  self->_timetag = a3;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (void)setDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_dateInterval, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInterval, 0);
}

@end
