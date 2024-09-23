@implementation FCDateRange

- (FCDateRange)initWithEarlierDate:(id)a3 laterDate:(id)a4
{
  return -[FCDateRange initWithStartDate:endDate:](self, "initWithStartDate:endDate:", a4, a3);
}

- (FCDateRange)initWithStartDate:(id)a3 endDate:(id)a4
{
  id v7;
  id v8;
  FCDateRange *v9;
  void *v11;
  objc_super v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)FCDateRange;
  v9 = -[FCDateRange init](&v12, sel_init);
  if (v9)
  {
    if (v7 && v8 && objc_msgSend(v7, "compare:", v8) == -1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Tried to create a date range with a startDate %@ earlier than the endDate %@"), v7, v8);
        *(_DWORD *)buf = 136315906;
        v14 = "-[FCDateRange initWithStartDate:endDate:]";
        v15 = 2080;
        v16 = "FCDateRange.m";
        v17 = 1024;
        v18 = 43;
        v19 = 2114;
        v20 = v11;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      v9 = 0;
    }
    else
    {
      objc_storeStrong((id *)&v9->_startDate, a3);
      objc_storeStrong((id *)&v9->_endDate, a4);
    }
  }

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[FCDateRange startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[FCDateRange endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (double)absoluteTimeInterval
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (!-[FCDateRange isFinite](self, "isFinite"))
    return 1.79769313e308;
  -[FCDateRange endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDateRange startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = fabs(v5);

  return v6;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  if (qword_1ED0F86E0 != -1)
    dispatch_once(&qword_1ED0F86E0, &__block_literal_global_147);
  if (-[FCDateRange isFinite](self, "isFinite"))
  {
    v3 = (void *)MEMORY[0x1E0CB3940];
    v4 = (void *)_MergedGlobals_198;
    -[FCDateRange startDate](self, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromDate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)_MergedGlobals_198;
    -[FCDateRange endDate](self, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringFromDate:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ to %@>"), v6, v9);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FCDateRange startDate](self, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = (void *)MEMORY[0x1E0CB3940];
      v13 = (void *)_MergedGlobals_198;
      -[FCDateRange startDate](self, "startDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringFromDate:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("<Infinite from %@>"), v6);
    }
    else
    {
      -[FCDateRange endDate](self, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
      {
        v10 = CFSTR("<Empty>");
        return v10;
      }
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = (void *)_MergedGlobals_198;
      -[FCDateRange endDate](self, "endDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringFromDate:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("<Infinite to %@>"), v6);
    }
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (BOOL)isFinite
{
  if (-[FCDateRange isFromInfinity](self, "isFromInfinity"))
    return 0;
  else
    return !-[FCDateRange isToInfinity](self, "isToInfinity");
}

- (NSDate)laterDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[FCDateRange startDate](self, "startDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[FCDateRange endDate](self, "endDate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[FCDateRange startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCDateRange endDate](self, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "laterDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FCDateRange startDate](self, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[FCDateRange startDate](self, "startDate");
    else
      -[FCDateRange endDate](self, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v8;
}

- (NSDate)earlierDate
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[FCDateRange startDate](self, "startDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[FCDateRange endDate](self, "endDate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    -[FCDateRange startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCDateRange endDate](self, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "earlierDate:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[FCDateRange startDate](self, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      -[FCDateRange startDate](self, "startDate");
    else
      -[FCDateRange endDate](self, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSDate *)v8;
}

- (BOOL)isToInfinity
{
  void *v2;
  BOOL v3;

  -[FCDateRange endDate](self, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (BOOL)isFromInfinity
{
  void *v2;
  BOOL v3;

  -[FCDateRange startDate](self, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

uint64_t __26__FCDateRange_description__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_198;
  _MergedGlobals_198 = (uint64_t)v0;

  return objc_msgSend((id)_MergedGlobals_198, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
}

+ (FCDateRange)dateRangeWithStartDate:(id)a3 endDate:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithStartDate:endDate:", v7, v6);

  return (FCDateRange *)v8;
}

+ (FCDateRange)dateRangeWithEarlierDate:(id)a3 laterDate:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithEarlierDate:laterDate:", v7, v6);

  return (FCDateRange *)v8;
}

- (FCDateRange)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCDateRange init]";
    v9 = 2080;
    v10 = "FCDateRange.m";
    v11 = 1024;
    v12 = 29;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCDateRange init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

- (FCDateRange)initWithStartDate:(id)a3 timeInterval:(double)a4
{
  double v5;
  id v6;
  void *v7;
  FCDateRange *v8;

  v5 = fabs(a4);
  v6 = a3;
  objc_msgSend(v6, "fc_dateBySubtractingTimeInterval:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[FCDateRange initWithStartDate:endDate:](self, "initWithStartDate:endDate:", v6, v7);

  return v8;
}

- (double)timeInterval
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  if (!-[FCDateRange isFinite](self, "isFinite"))
    return 1.79769313e308;
  -[FCDateRange endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCDateRange startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (unint64_t)minMillisecondsTimeIntervalSince1970
{
  void *v2;
  unint64_t v3;

  -[FCDateRange earlierDate](self, "earlierDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fc_millisecondTimeIntervalSince1970");

  return v3;
}

- (unint64_t)maxMillisecondsTimeIntervalSince1970
{
  void *v2;
  unint64_t v3;

  -[FCDateRange laterDate](self, "laterDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fc_millisecondTimeIntervalSince1970");

  return v3;
}

- (BOOL)containsDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;

  v4 = a3;
  -[FCDateRange startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FCDateRange startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSince1970");
    v8 = v7;
    objc_msgSend(v4, "timeIntervalSince1970");
    v10 = v9;

    if (v8 < v10)
    {
LABEL_3:
      v11 = 0;
      goto LABEL_8;
    }
  }
  else if (!v4)
  {
    goto LABEL_3;
  }
  -[FCDateRange endDate](self, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[FCDateRange endDate](self, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timeIntervalSince1970");
    v15 = v14;
    objc_msgSend(v4, "timeIntervalSince1970");
    v11 = v15 < v16;

  }
  else
  {
    v11 = 1;
  }
LABEL_8:

  return v11;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0DE7910];
  -[FCDateRange endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "nf_object:isEqualToObject:", v6, v7);

  if ((_DWORD)v5)
  {
    v8 = (void *)MEMORY[0x1E0DE7910];
    -[FCDateRange startDate](self, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v8, "nf_object:isEqualToObject:", v9, v10);

    if ((v8 & 1) != 0)
    {
      v11 = 0;
      goto LABEL_16;
    }
    -[FCDateRange startDate](self, "startDate");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v21 = (void *)v20;
      objc_msgSend(v4, "startDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        -[FCDateRange startDate](self, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "startDate");
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
    -[FCDateRange startDate](self, "startDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v24 == 0;
    v19 = 1;
  }
  else
  {
    -[FCDateRange endDate](self, "endDate");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v4, "endDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        -[FCDateRange endDate](self, "endDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "endDate");
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_11:
        v23 = (void *)v16;
        v11 = objc_msgSend(v15, "compare:", v16);

        goto LABEL_16;
      }
    }
    -[FCDateRange endDate](self, "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v17 == 0;
    v19 = -1;
  }
  if (v18)
    v11 = v19;
  else
    v11 = -v19;
LABEL_16:

  return v11;
}

- (BOOL)isWithinTimeInterval:(double)a3 ofDateRange:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v6 = a4;
  -[FCDateRange startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "fc_isWithinTimeInterval:ofDate:", v8, a3))
  {
    -[FCDateRange endDate](self, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "fc_isWithinTimeInterval:ofDate:", v10, a3);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)startsLaterThanDateRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FCDateRange startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "fc_isLaterThan:", v6);
  return (char)v4;
}

- (id)slicesWithTimeInterval:(double)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__FCDateRange_slicesWithTimeInterval___block_invoke;
  v4[3] = &unk_1E4648AF0;
  *(double *)&v4[5] = a3;
  v4[4] = self;
  objc_msgSend(MEMORY[0x1E0C99D20], "fc_array:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __38__FCDateRange_slicesWithTimeInterval___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  FCDateRange *v15;
  void *v16;
  void *v17;
  FCDateRange *v18;
  id v19;

  v19 = a2;
  v3 = *(double *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSince1970");
  v9 = v8;

  if (objc_msgSend(*(id *)(a1 + 32), "isFinite")
    && ((v10 = (uint64_t)v3, v11 = vcvtmd_s64_f64(v6), v12 = vcvtmd_s64_f64(v9), v11 - v12 > (uint64_t)v3)
     || v12 % v10 > v11 % v10))
  {
    if (v11 > v12)
    {
      v13 = v11 / v10 * v10;
      do
      {
        v14 = v13;
        v15 = [FCDateRange alloc];
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (double)v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[FCDateRange initWithStartDate:endDate:](v15, "initWithStartDate:endDate:", v16, v17);
        objc_msgSend(v19, "addObject:", v18);

        v13 = v14 - v10;
        if (v14 - v10 <= v12)
          v13 = v12;
        v11 = v14;
      }
      while (v14 > v12);
    }
  }
  else
  {
    objc_msgSend(v19, "addObject:", *(_QWORD *)(a1 + 32));
  }

}

- (id)sliceForDate:(id)a3 withInterval:(double)a4
{
  id v6;
  _BOOL4 v7;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  FCDateRange *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  FCDateRange *v22;
  _QWORD v24[7];

  v6 = a3;
  v7 = -[FCDateRange containsDate:](self, "containsDate:", v6);
  if (a4 <= 0.0 || !v7)
  {
    v22 = 0;
  }
  else
  {
    -[FCDateRange startDate](self, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    v11 = v10;
    objc_msgSend(v6, "timeIntervalSince1970");
    v13 = v11 - v12;

    v14 = vcvtmd_s64_f64(v13 / a4) + 1;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __41__FCDateRange_sliceForDate_withInterval___block_invoke;
    v24[3] = &unk_1E4648B18;
    v15 = -((double)(uint64_t)floor(v13 / a4) * a4);
    v24[4] = self;
    v24[5] = v14;
    *(double *)&v24[6] = a4;
    v16 = __41__FCDateRange_sliceForDate_withInterval___block_invoke((uint64_t)v24);
    v17 = [FCDateRange alloc];
    -[FCDateRange startDate](self, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dateByAddingTimeInterval:", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCDateRange startDate](self, "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "dateByAddingTimeInterval:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[FCDateRange initWithStartDate:endDate:](v17, "initWithStartDate:endDate:", v19, v21);

  }
  return v22;
}

double __41__FCDateRange_sliceForDate_withInterval___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(*(id *)(a1 + 32), "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = -(*(double *)(a1 + 48) * (double)*(uint64_t *)(a1 + 40));
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSince1970");
    v6 = v5;
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSince1970");
    v9 = v6 - v8;

    if (v3 < v9)
      return v9;
  }
  return v3;
}

- (int64_t)sliceIndexForDate:(id)a3 withInterval:(double)a4
{
  id v6;
  _BOOL4 v7;
  void *v9;
  double v10;
  double v11;
  double v12;
  int64_t v13;

  v6 = a3;
  v7 = -[FCDateRange containsDate:](self, "containsDate:", v6);
  if (a4 <= 0.0 || !v7)
  {
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    -[FCDateRange startDate](self, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSince1970");
    v11 = v10;
    objc_msgSend(v6, "timeIntervalSince1970");
    v13 = vcvtmd_s64_f64((v11 - v12) / a4);

  }
  return v13;
}

- (id)intersectionWithDateRange:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;

  v4 = a3;
  if (-[FCDateRange isFromInfinity](self, "isFromInfinity") && (objc_msgSend(v4, "isFromInfinity") & 1) != 0)
  {
    v5 = 0;
  }
  else if (-[FCDateRange isFromInfinity](self, "isFromInfinity"))
  {
    objc_msgSend(v4, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_msgSend(v4, "isFromInfinity");
    -[FCDateRange startDate](self, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v6 & 1) == 0)
    {
      objc_msgSend(v4, "startDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "earlierDate:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v8;
    }
  }
  if (-[FCDateRange isToInfinity](self, "isToInfinity") && (objc_msgSend(v4, "isToInfinity") & 1) != 0)
  {
    v9 = 0;
  }
  else if (-[FCDateRange isToInfinity](self, "isToInfinity"))
  {
    objc_msgSend(v4, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = objc_msgSend(v4, "isToInfinity");
    -[FCDateRange endDate](self, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v10 & 1) == 0)
    {
      objc_msgSend(v4, "endDate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "laterDate:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v12;
    }
  }
  if (objc_msgSend(v9, "fc_isLaterThan:", v5))
  {
    v13 = v5;

    v9 = v13;
  }
  +[FCDateRange dateRangeWithStartDate:endDate:](FCDateRange, "dateRangeWithStartDate:endDate:", v5, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)timestampDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  unint64_t v12;
  double v13;
  void *v14;

  -[FCDateRange startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  -[FCDateRange endDate](self, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v6, "timeIntervalSince1970");
  v12 = (unint64_t)(v11 * 1000.0);
  objc_msgSend(v10, "timeIntervalSince1970");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu-%lu"), v12, (unint64_t)(v13 * 1000.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = a3;
  -[FCDateRange startDate](self, "startDate");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 | v6 && !objc_msgSend((id)v5, "isEqualToDate:", v6))
  {
    v9 = 0;
  }
  else
  {
    -[FCDateRange endDate](self, "endDate");
    v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v7 | v8)
      v9 = objc_msgSend((id)v7, "isEqualToDate:", v8);
    else
      v9 = 1;

  }
  return v9;
}

- (FCDateRange)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  FCDateRange *v7;

  v4 = a3;
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("startDate")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startDate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("endDate")))
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = -[FCDateRange initWithStartDate:endDate:](self, "initWithStartDate:endDate:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[FCDateRange startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[FCDateRange startDate](self, "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("startDate"));

  }
  -[FCDateRange endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[FCDateRange endDate](self, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("endDate"));

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
