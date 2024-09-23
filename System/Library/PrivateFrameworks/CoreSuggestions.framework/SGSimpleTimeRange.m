@implementation SGSimpleTimeRange

- (id)initUTCFloatingWithStart:(SGUnixTimestamp_)a3 end:(SGUnixTimestamp_)a4
{
  id result;
  double secondsFromUnixEpoch;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SGSimpleTimeRange;
  result = -[SGSimpleTimeRange init](&v8, sel_init);
  if (result)
  {
    if (a4.secondsFromUnixEpoch >= a3.secondsFromUnixEpoch)
      secondsFromUnixEpoch = a4.secondsFromUnixEpoch;
    else
      secondsFromUnixEpoch = a3.secondsFromUnixEpoch;
    *((double *)result + 1) = a3.secondsFromUnixEpoch;
    *((double *)result + 2) = secondsFromUnixEpoch;
    *((_BYTE *)result + 40) = 1;
  }
  return result;
}

- (SGSimpleTimeRange)initWithStart:(SGUnixTimestamp_)a3 startUTCOffsetSeconds:(int64_t)a4 end:(SGUnixTimestamp_)a5 endUTCOffsetSeconds:(int64_t)a6
{
  SGSimpleTimeRange *result;
  double secondsFromUnixEpoch;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SGSimpleTimeRange;
  result = -[SGSimpleTimeRange init](&v12, sel_init);
  if (result)
  {
    if (a5.secondsFromUnixEpoch >= a3.secondsFromUnixEpoch)
      secondsFromUnixEpoch = a5.secondsFromUnixEpoch;
    else
      secondsFromUnixEpoch = a3.secondsFromUnixEpoch;
    result->_start.secondsFromUnixEpoch = a3.secondsFromUnixEpoch;
    result->_end.secondsFromUnixEpoch = secondsFromUnixEpoch;
    result->_startUTCOffsetSeconds = a4;
    result->_endUTCOffsetSeconds = a6;
    result->_floating = 0;
  }
  return result;
}

- (id)absoluteRange
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  SGSimpleTimeRange *v8;

  if (self->_floating)
  {
    +[SGSimpleTimeRange fromFloatingTime:](SGSimpleTimeRange, "fromFloatingTime:", self->_start.secondsFromUnixEpoch);
    v4 = v3;
    +[SGSimpleTimeRange fromFloatingTime:](SGSimpleTimeRange, "fromFloatingTime:", self->_end.secondsFromUnixEpoch);
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGSimpleTimeRange rangeWithStart:end:timeZone:](SGSimpleTimeRange, "rangeWithStart:end:timeZone:", v7, v4, v6);
    v8 = (SGSimpleTimeRange *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = self;
  }
  return v8;
}

- (id)stableStringRepresentation
{
  _BOOL4 floating;
  id v4;
  double secondsFromUnixEpoch;
  void *v6;
  uint64_t v8;
  uint64_t v9;

  floating = self->_floating;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  secondsFromUnixEpoch = self->_start.secondsFromUnixEpoch;
  if (floating)
    v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%0.2f_%0.2f"), secondsFromUnixEpoch, *(_QWORD *)&self->_start.secondsFromUnixEpoch, *(_QWORD *)&self->_end.secondsFromUnixEpoch, v8, v9);
  else
    v6 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%0.2f(%ld)_%0.2f(%ld)"), secondsFromUnixEpoch, *(_QWORD *)&secondsFromUnixEpoch, self->_startUTCOffsetSeconds, *(_QWORD *)&self->_end.secondsFromUnixEpoch, self->_endUTCOffsetSeconds);
  return v6;
}

- (NSDate)startDate
{
  return (NSDate *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", self->_start.secondsFromUnixEpoch);
}

- (NSDate)endDate
{
  return (NSDate *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", self->_end.secondsFromUnixEpoch);
}

- (NSTimeZone)startTimeZone
{
  NSTimeZone *v2;
  NSTimeZone *startTimeZone;
  void *v5;
  void *v6;
  uint64_t v7;

  if (self->_floating)
  {
    v2 = 0;
  }
  else
  {
    startTimeZone = self->_startTimeZone;
    if (startTimeZone)
    {
      v2 = startTimeZone;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGSimpleTimeRange startDate](self, "startDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "secondsFromGMTForDate:", v6);

      if (v7 == self->_startUTCOffsetSeconds)
        objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      else
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:");
      v2 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v2;
}

- (NSTimeZone)endTimeZone
{
  NSTimeZone *v2;
  NSTimeZone *endTimeZone;
  void *v5;
  void *v6;
  uint64_t v7;

  if (self->_floating)
  {
    v2 = 0;
  }
  else
  {
    endTimeZone = self->_endTimeZone;
    if (endTimeZone)
    {
      v2 = endTimeZone;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SGSimpleTimeRange endDate](self, "endDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "secondsFromGMTForDate:", v6);

      if (v7 == self->_endUTCOffsetSeconds)
        objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
      else
        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:");
      v2 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v2;
}

- (id)_componentsForDate:(id)a3 timeZone:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1A8583A40]();
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v8, "setTimeZone:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTimeZone:", v10);

  }
  objc_msgSend(v9, "components:fromDate:", 1048828, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimeZone:", v6);

  objc_autoreleasePoolPop(v7);
  return v11;
}

- (id)startDateComponents
{
  void *v3;
  void *v4;
  void *v5;

  -[SGSimpleTimeRange startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSimpleTimeRange startTimeZone](self, "startTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSimpleTimeRange _componentsForDate:timeZone:](self, "_componentsForDate:timeZone:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)endDateComponents
{
  void *v3;
  void *v4;
  void *v5;

  -[SGSimpleTimeRange endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSimpleTimeRange endTimeZone](self, "endTimeZone");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSimpleTimeRange _componentsForDate:timeZone:](self, "_componentsForDate:timeZone:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isValidAllDayRange
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v7;

  v3 = (void *)MEMORY[0x1A8583A40](self, a2);
  -[SGSimpleTimeRange startDateComponents](self, "startDateComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "hour") || objc_msgSend(v4, "minute") || objc_msgSend(v4, "second"))
  {
    v5 = 0;
  }
  else
  {
    -[SGSimpleTimeRange endDateComponents](self, "endDateComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = !objc_msgSend(v7, "hour") && !objc_msgSend(v7, "minute") && !objc_msgSend(v7, "second")
      || objc_msgSend(v7, "hour") >= 23 && objc_msgSend(v7, "minute") >= 59 && objc_msgSend(v7, "second") >= 59;

  }
  objc_autoreleasePoolPop(v3);
  return v5;
}

- (BOOL)startedMoreThan24HoursAgo
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  BOOL v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", -86400.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSince1970");
  v6 = v5;
  -[SGSimpleTimeRange absoluteRange](self, "absoluteRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");
  v9 = v6 - v8 > 0.0;

  return v9;
}

- (void)applyToEKEvent:(id)a3 isAllDay:(BOOL)a4 isFloating:(BOOL)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  void *v31;
  id v32;

  v6 = a4;
  v32 = a3;
  -[SGSimpleTimeRange startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSimpleTimeRange endDate](self, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SGSimpleTimeRange startTimeZone](self, "startTimeZone");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SGSimpleTimeRange endTimeZone](self, "endTimeZone");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = 0x1E0C99000uLL;
  if (v6)
  {
    -[SGSimpleTimeRange startDateComponents](self, "startDateComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGSimpleTimeRange endDateComponents](self, "endDateComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTimeZone:", v16);
    objc_msgSend(v15, "setTimeZone:", v16);
    objc_msgSend(v14, "calendar");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "dateFromComponents:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "calendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateFromComponents:", v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "dateByAddingTimeInterval:", -1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = 0x1E0C99000;
    v10 = 0;
    v12 = v14;
LABEL_11:

    v12 = v10;
    goto LABEL_12;
  }
  if (!v10)
  {
    +[SGSimpleTimeRange fromFloatingTime:](SGSimpleTimeRange, "fromFloatingTime:", self->_start.secondsFromUnixEpoch);
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v21);

    if (a5)
    {
      +[SGSimpleTimeRange fromFloatingTime:](SGSimpleTimeRange, "fromFloatingTime:", self->_end.secondsFromUnixEpoch);
      v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v22);

      v10 = 0;
      v9 = (void *)v23;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
      goto LABEL_12;
LABEL_9:
    if (!v10)
      goto LABEL_12;
    -[SGSimpleTimeRange endDateComponents](self, "endDateComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTimeZone:", v10);
    objc_msgSend(v12, "calendar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "dateFromComponents:", v12);
    v25 = objc_claimAutoreleasedReturnValue();

    v10 = v10;
    v9 = (void *)v25;
    goto LABEL_11;
  }
  v18 = v8;
  if (!v11)
    goto LABEL_9;
LABEL_12:
  v26 = *(void **)(v13 + 3432);
  objc_msgSend(v18, "timeIntervalSinceReferenceDate");
  objc_msgSend(v26, "dateWithTimeIntervalSinceReferenceDate:", floor(v27));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = *(void **)(v13 + 3432);
  objc_msgSend(v9, "timeIntervalSinceReferenceDate");
  objc_msgSend(v29, "dateWithTimeIntervalSinceReferenceDate:", floor(v30));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(v32, "setStartTimeZone:", v10);
    objc_msgSend(v32, "setEndTimeZone:", v12);
  }
  objc_msgSend(v32, "setAllDay:", v6);
  objc_msgSend(v32, "setStartDate:", v28);
  objc_msgSend(v32, "setEndDateUnadjustedForLegacyClients:", v31);

}

- (BOOL)isEqual:(id)a3
{
  SGSimpleTimeRange *v4;
  SGSimpleTimeRange *v5;
  BOOL v6;

  v4 = (SGSimpleTimeRange *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[SGSimpleTimeRange isEqualToSimpleTimeRange:](self, "isEqualToSimpleTimeRange:", v5);

  return v6;
}

- (BOOL)isEqualToSimpleTimeRange:(id)a3
{
  id v4;
  double v5;
  double v6;
  int floating;
  BOOL v8;
  int64_t startUTCOffsetSeconds;
  int64_t endUTCOffsetSeconds;

  v4 = a3;
  objc_msgSend(v4, "start");
  if (self->_start.secondsFromUnixEpoch != v5)
    goto LABEL_8;
  objc_msgSend(v4, "end");
  if (self->_end.secondsFromUnixEpoch != v6)
    goto LABEL_8;
  floating = self->_floating;
  if (floating != objc_msgSend(v4, "isFloating"))
    goto LABEL_8;
  if (!self->_floating)
  {
    startUTCOffsetSeconds = self->_startUTCOffsetSeconds;
    if (startUTCOffsetSeconds == objc_msgSend(v4, "startUTCOffsetSeconds"))
    {
      endUTCOffsetSeconds = self->_endUTCOffsetSeconds;
      v8 = endUTCOffsetSeconds == objc_msgSend(v4, "endUTCOffsetSeconds");
      goto LABEL_9;
    }
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v8 = 1;
LABEL_9:

  return v8;
}

- (unint64_t)hash
{
  return (unint64_t)self->_end.secondsFromUnixEpoch
       - (unint64_t)self->_start.secondsFromUnixEpoch
       + 32 * (unint64_t)self->_start.secondsFromUnixEpoch;
}

- (SGSimpleTimeRange)initWithCoder:(id)a3
{
  id v4;
  SGSimpleTimeRange *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  NSTimeZone *startTimeZone;
  void *v11;
  uint64_t v12;
  NSTimeZone *endTimeZone;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGSimpleTimeRange;
  v5 = -[SGSimpleTimeRange init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("start"));
    v5->_start.secondsFromUnixEpoch = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("end"));
    v5->_end.secondsFromUnixEpoch = v7;
    v5->_startUTCOffsetSeconds = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("startUTCOffsetSeconds"));
    v5->_endUTCOffsetSeconds = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("endUTCOffsetSeconds"));
    v5->_floating = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("floating"));
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("startTimeZone"));
    v9 = objc_claimAutoreleasedReturnValue();
    startTimeZone = v5->_startTimeZone;
    v5->_startTimeZone = (NSTimeZone *)v9;

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("endTimeZone"));
    v12 = objc_claimAutoreleasedReturnValue();
    endTimeZone = v5->_endTimeZone;
    v5->_endTimeZone = (NSTimeZone *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double secondsFromUnixEpoch;
  id v5;

  secondsFromUnixEpoch = self->_start.secondsFromUnixEpoch;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("start"), secondsFromUnixEpoch);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("end"), self->_end.secondsFromUnixEpoch);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_startUTCOffsetSeconds, CFSTR("startUTCOffsetSeconds"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_endUTCOffsetSeconds, CFSTR("endUTCOffsetSeconds"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_floating, CFSTR("floating"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_startTimeZone, CFSTR("startTimeZone"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_endTimeZone, CFSTR("endTimeZone"));

}

- (SGUnixTimestamp_)start
{
  return self->_start;
}

- (SGUnixTimestamp_)end
{
  return self->_end;
}

- (int64_t)startUTCOffsetSeconds
{
  return self->_startUTCOffsetSeconds;
}

- (int64_t)endUTCOffsetSeconds
{
  return self->_endUTCOffsetSeconds;
}

- (BOOL)isFloating
{
  return self->_floating;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimeZone, 0);
  objc_storeStrong((id *)&self->_startTimeZone, 0);
}

+ (SGUnixTimestamp_)toFloatingTime:(SGUnixTimestamp_)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  SGUnixTimestamp_ v10;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", a3.secondsFromUnixEpoch);
  objc_msgSend(v4, "components:fromDate:", 3145980, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v7);

  objc_msgSend(v4, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  v10.secondsFromUnixEpoch = v9;

  return v10;
}

+ (SGUnixTimestamp_)toFloatingTime:(SGUnixTimestamp_)a3 withDSTAmbiguityPreferences:(id)a4
{
  id v7;
  void *v8;
  double v9;
  SGUnixTimestamp_ v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  BOOL v21;
  double v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v7 = a4;
  v8 = (void *)MEMORY[0x1A8583A40]();
  +[SGSimpleTimeRange toFloatingTime:](SGSimpleTimeRange, "toFloatingTime:", a3.secondsFromUnixEpoch);
  v10.secondsFromUnixEpoch = v9;
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", a3.secondsFromUnixEpoch);
  objc_msgSend(v12, "dateByAddingTimeInterval:", -7200.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "nextDaylightSavingTimeTransitionAfterDate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v12, "timeIntervalSinceDate:", v14);
    if (v15 >= 0.0)
    {
      v16 = v15;
      objc_msgSend(v11, "daylightSavingTimeOffsetForDate:", v13);
      v18 = v17;
      objc_msgSend(v11, "daylightSavingTimeOffsetForDate:", v12);
      v20 = v19;
      if (v18 == v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v42 = v8;
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGSimpleTimeRange.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("offsetBefore != offsetAfter"));

        v8 = v42;
      }
      v21 = v18 <= v20;
      v22 = v20 - v18;
      if (v21 && v22 >= v16)
      {
        v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", v10.secondsFromUnixEpoch);
        objc_msgSend(v24, "dateByAddingTimeInterval:", -v22);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "calendar");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v25, "copy");
        v27 = v26;
        v46 = v7;
        v41 = v8;
        if (v26)
        {
          v28 = v26;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
          v28 = (id)objc_claimAutoreleasedReturnValue();
        }
        v29 = v28;

        objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setTimeZone:", v30);

        v40 = v24;
        objc_msgSend(v29, "components:fromDate:", 33020, v24);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "components:fromDate:", 33020, v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = 0;
        while (1)
        {
          v32 = qword_1A22EAF90[v31];
          v33 = objc_msgSend(v46, "valueForComponent:", v32);
          if (v33 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v34 = v33;
            v35 = objc_msgSend(v45, "valueForComponent:", v32);
            v36 = objc_msgSend(v44, "valueForComponent:", v32);
            if (v35 != v36)
            {
              if (v35 == v34)
                goto LABEL_18;
              if (v36 == v34)
                break;
            }
          }
          if (++v31 == 7)
            goto LABEL_18;
        }
        objc_msgSend(v43, "timeIntervalSince1970");
        v10.secondsFromUnixEpoch = v38;
LABEL_18:

        v7 = v46;
        v8 = v41;
      }
    }
  }

  objc_autoreleasePoolPop(v8);
  return v10;
}

+ (SGUnixTimestamp_)fromFloatingTime:(SGUnixTimestamp_)a3
{
  double v4;
  SGUnixTimestamp_ v5;

  +[SGSimpleTimeRange toFloatingTime:](SGSimpleTimeRange, "toFloatingTime:");
  v5.secondsFromUnixEpoch = -(v4 - a3.secondsFromUnixEpoch * 2.0);
  return v5;
}

+ (id)dateFromGregorianComponents:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  objc_msgSend(v5, "calendar");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "calendar");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "calendarIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)*MEMORY[0x1E0C996C8];

    if (v9 != v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGSimpleTimeRange.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("components.calendar == nil || components.calendar.calendarIdentifier == NSCalendarIdentifierGregorian"));

      v9 = v10;
    }
  }
  else
  {
    v9 = (void *)*MEMORY[0x1E0C996C8];
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D48]), "initWithCalendarIdentifier:", v9);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTimeZone:", v13);

  objc_msgSend(v12, "dateFromComponents:", v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (BOOL)isAllDayComponents:(id)a3
{
  return objc_msgSend(a3, "hour") == 0x7FFFFFFFFFFFFFFFLL;
}

+ (BOOL)hasYearMonthDayComponents:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "year") != 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v3, "month") != 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(v3, "day") != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

+ (id)rangeWithGregorianStartComponents:(id)a3 endComponents:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    v14 = 0;
    v9 = 0;
    goto LABEL_23;
  }
  if (!+[SGSimpleTimeRange hasYearMonthDayComponents:](SGSimpleTimeRange, "hasYearMonthDayComponents:", v7))
  {
    v14 = 0;
    v9 = v7;
    goto LABEL_23;
  }
  v9 = (void *)objc_msgSend(v7, "copy");

  if (v8
    && +[SGSimpleTimeRange hasYearMonthDayComponents:](SGSimpleTimeRange, "hasYearMonthDayComponents:", v8))
  {
    v10 = (void *)objc_msgSend(v8, "copy");

    objc_msgSend(v9, "timeZone");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timeZone");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 == 0;

    if ((v11 == 0) == v13)
      goto LABEL_11;
    objc_msgSend(v9, "timeZone");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTimeZone:", v8);
  }
  else
  {
    v10 = (void *)objc_msgSend(v9, "copy");
  }

LABEL_11:
  v8 = v10;
  v15 = +[SGSimpleTimeRange isAllDayComponents:](SGSimpleTimeRange, "isAllDayComponents:", v9);
  if (v15 != +[SGSimpleTimeRange isAllDayComponents:](SGSimpleTimeRange, "isAllDayComponents:", v8))
  {
    objc_msgSend(v8, "setHour:", objc_msgSend(v9, "hour"));
    objc_msgSend(v8, "setMinute:", objc_msgSend(v9, "minute"));
    objc_msgSend(v8, "setSecond:", objc_msgSend(v9, "second"));
    objc_msgSend(v8, "setNanosecond:", objc_msgSend(v9, "nanosecond"));
  }
  if (+[SGSimpleTimeRange isAllDayComponents:](SGSimpleTimeRange, "isAllDayComponents:", v9))
  {
    objc_msgSend(v8, "setHour:", 24);
    objc_msgSend(v8, "setMinute:", 0);
    objc_msgSend(v8, "setSecond:", 0);
    objc_msgSend(v8, "setNanosecond:", 0);
  }
  +[SGSimpleTimeRange dateFromGregorianComponents:](SGSimpleTimeRange, "dateFromGregorianComponents:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGSimpleTimeRange dateFromGregorianComponents:](SGSimpleTimeRange, "dateFromGregorianComponents:", v8);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGSimpleTimeRange.m"), 180, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startDate"));

    if (v18)
      goto LABEL_17;
LABEL_25:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGSimpleTimeRange.m"), 181, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("endDate"));

    goto LABEL_17;
  }
  if (!v17)
    goto LABEL_25;
LABEL_17:
  objc_msgSend(v9, "timeZone");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v8, "timeZone");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SGSimpleTimeRange.m"), 184, CFSTR("if the start has a timezone, then end should too"));

    }
    objc_msgSend(v9, "timeZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeZone");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGSimpleTimeRange rangeWithStartDate:startTimeZone:endDate:endTimeZone:](SGSimpleTimeRange, "rangeWithStartDate:startTimeZone:endDate:endTimeZone:", v16, v21, v18, v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[SGSimpleTimeRange floatingRangeWithUTCStartDate:endDate:](SGSimpleTimeRange, "floatingRangeWithUTCStartDate:endDate:", v16, v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_23:
  return v14;
}

+ (id)rangeWithStart:(SGUnixTimestamp_)a3 startTimeZone:(id)a4 end:(SGUnixTimestamp_)a5 endTimeZone:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = (objc_class *)MEMORY[0x1E0C99D68];
  v10 = a6;
  v11 = a4;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithTimeIntervalSince1970:", a3.secondsFromUnixEpoch);
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", a5.secondsFromUnixEpoch);
  +[SGSimpleTimeRange rangeWithStartDate:startTimeZone:endDate:endTimeZone:](SGSimpleTimeRange, "rangeWithStartDate:startTimeZone:endDate:endTimeZone:", v12, v11, v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)rangeWithStartDate:(id)a3 startTimeZone:(id)a4 endDate:(id)a5 endTimeZone:(id)a6
{
  NSTimeZone *v9;
  NSTimeZone *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  SGSimpleTimeRange *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SGSimpleTimeRange *v20;
  NSTimeZone *startTimeZone;
  NSTimeZone *v22;
  NSTimeZone *endTimeZone;

  v9 = (NSTimeZone *)a4;
  v10 = (NSTimeZone *)a6;
  v11 = a5;
  v12 = a3;
  v13 = -[NSTimeZone secondsFromGMTForDate:](v9, "secondsFromGMTForDate:", v12);
  v14 = -[NSTimeZone secondsFromGMTForDate:](v10, "secondsFromGMTForDate:", v11);
  v15 = [SGSimpleTimeRange alloc];
  objc_msgSend(v12, "timeIntervalSince1970");
  v17 = v16;

  objc_msgSend(v11, "timeIntervalSince1970");
  v19 = v18;

  v20 = -[SGSimpleTimeRange initWithStart:startUTCOffsetSeconds:end:endUTCOffsetSeconds:](v15, "initWithStart:startUTCOffsetSeconds:end:endUTCOffsetSeconds:", v13, v14, v17, v19);
  startTimeZone = v20->_startTimeZone;
  v20->_startTimeZone = v9;
  v22 = v9;

  endTimeZone = v20->_endTimeZone;
  v20->_endTimeZone = v10;

  return v20;
}

+ (id)rangeWithStart:(SGUnixTimestamp_)a3 end:(SGUnixTimestamp_)a4 timeZone:(id)a5
{
  return +[SGSimpleTimeRange rangeWithStart:startTimeZone:end:endTimeZone:](SGSimpleTimeRange, "rangeWithStart:startTimeZone:end:endTimeZone:", a5, a5, a3.secondsFromUnixEpoch, a4.secondsFromUnixEpoch);
}

+ (id)utcRangeWithStart:(SGUnixTimestamp_)a3 end:(SGUnixTimestamp_)a4
{
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[SGSimpleTimeRange rangeWithStart:end:timeZone:](SGSimpleTimeRange, "rangeWithStart:end:timeZone:", v6, a3.secondsFromUnixEpoch, a4.secondsFromUnixEpoch);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)rangeWithStart:(SGUnixTimestamp_)a3 duration:(double)a4 timeZone:(id)a5
{
  return +[SGSimpleTimeRange rangeWithStart:end:timeZone:](SGSimpleTimeRange, "rangeWithStart:end:timeZone:", a5, a3.secondsFromUnixEpoch, a3.secondsFromUnixEpoch + a4);
}

+ (id)utcRangeWithStart:(SGUnixTimestamp_)a3 duration:(double)a4
{
  return +[SGSimpleTimeRange utcRangeWithStart:end:](SGSimpleTimeRange, "utcRangeWithStart:end:", a3.secondsFromUnixEpoch, a3.secondsFromUnixEpoch + a4);
}

+ (id)floatingRangeWithUTCStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  id v6;
  SGSimpleTimeRange *v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v5 = a4;
  v6 = a3;
  v7 = [SGSimpleTimeRange alloc];
  objc_msgSend(v6, "timeIntervalSince1970");
  v9 = v8;

  objc_msgSend(v5, "timeIntervalSince1970");
  v11 = v10;

  return -[SGSimpleTimeRange initUTCFloatingWithStart:end:](v7, "initUTCFloatingWithStart:end:", v9, v11);
}

+ (id)floatingRangeWithUTCStart:(SGUnixTimestamp_)a3 end:(SGUnixTimestamp_)a4
{
  return -[SGSimpleTimeRange initUTCFloatingWithStart:end:]([SGSimpleTimeRange alloc], "initUTCFloatingWithStart:end:", a3.secondsFromUnixEpoch, a4.secondsFromUnixEpoch);
}

+ (id)floatingRangeWithLocalStartDate:(id)a3 endDate:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v5 = a4;
  objc_msgSend(a3, "timeIntervalSince1970");
  +[SGSimpleTimeRange toFloatingTime:](SGSimpleTimeRange, "toFloatingTime:");
  v7 = v6;
  objc_msgSend(v5, "timeIntervalSince1970");
  v9 = v8;

  +[SGSimpleTimeRange toFloatingTime:](SGSimpleTimeRange, "toFloatingTime:", v9);
  return -[SGSimpleTimeRange initUTCFloatingWithStart:end:]([SGSimpleTimeRange alloc], "initUTCFloatingWithStart:end:", v7, v10);
}

+ (id)floatingRangeWithLocalStart:(SGUnixTimestamp_)a3 end:(SGUnixTimestamp_)a4
{
  SGSimpleTimeRange *v6;
  double v7;
  double v8;
  double v9;

  v6 = [SGSimpleTimeRange alloc];
  +[SGSimpleTimeRange toFloatingTime:](SGSimpleTimeRange, "toFloatingTime:", a3.secondsFromUnixEpoch);
  v8 = v7;
  +[SGSimpleTimeRange toFloatingTime:](SGSimpleTimeRange, "toFloatingTime:", a4.secondsFromUnixEpoch);
  return -[SGSimpleTimeRange initUTCFloatingWithStart:end:](v6, "initUTCFloatingWithStart:end:", v8, v9);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
