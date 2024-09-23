@implementation HKMCProjection

- (HKMCProjection)initWithStartMean:(double)a3 startStandardDeviation:(double)a4 endMean:(double)a5 endStandardDeviation:(double)a6 allDays:(id)a7 partiallyLogged:(BOOL)a8 daysOffsetFromCalendarMethod:(int64_t)a9 predictionPrimarySource:(int64_t)a10
{
  int64_t var1;
  int64_t var0;
  HKMCProjection *v20;
  HKMCProjection *v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v26;
  void *v28;
  HKMCProjection *v29;
  void *v31;
  objc_super v32;

  var1 = a7.var1;
  var0 = a7.var0;
  v32.receiver = self;
  v32.super_class = (Class)HKMCProjection;
  v20 = -[HKMCProjection init](&v32, sel_init);
  v21 = v20;
  if (!v20)
    goto LABEL_15;
  v20->_startMean = a3;
  v20->_startStandardDeviation = a4;
  v20->_endMean = a5;
  v20->_endStandardDeviation = a6;
  v20->_allDays.start = var0;
  v20->_allDays.duration = var1;
  v20->_partiallyLogged = a8;
  v20->_daysOffsetFromCalendarMethod = a9;
  v20->_predictionPrimarySource = a10;
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isAppleInternalInstall");

  if (v23)
  {
    -[HKMCProjection mostLikelyDays](v21, "mostLikelyDays");
    if (HKUnionDayIndexRange() != var0 || v24 != var1)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("HKMCProjection.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("HKEqualDayIndexRanges(HKUnionDayIndexRange([self mostLikelyDays], allDays), allDays)"));

    }
  }
  -[HKMCProjection mostLikelyDays](v21, "mostLikelyDays");
  if (HKUnionDayIndexRange() == var0 && v26 == var1)
  {
LABEL_15:
    v29 = v21;
  }
  else
  {
    _HKInitializeLogging();
    v28 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_FAULT))
      -[HKMCProjection initWithStartMean:startStandardDeviation:endMean:endStandardDeviation:allDays:partiallyLogged:daysOffsetFromCalendarMethod:predictionPrimarySource:].cold.1(v28);
    v29 = 0;
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double startMean;
  id v5;

  startMean = self->_startMean;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("StartMean"), startMean);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("StartStandardDeviation"), self->_startStandardDeviation);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("EndMean"), self->_endMean);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("EndStandardDeviation"), self->_endStandardDeviation);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_allDays.start, CFSTR("AllDaysStart"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_allDays.duration, CFSTR("AllDaysDuration"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_partiallyLogged, CFSTR("PartiallyLogged"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_daysOffsetFromCalendarMethod, CFSTR("DaysOffsetFromCalendarMethod"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_predictionPrimarySource, CFSTR("PredictionPrimarySource"));

}

- (HKMCProjection)initWithCoder:(id)a3
{
  id v4;
  HKMCProjection *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKMCProjection;
  v5 = -[HKMCProjection init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("StartMean"));
    v5->_startMean = v6;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("StartStandardDeviation"));
    v5->_startStandardDeviation = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("EndMean"));
    v5->_endMean = v8;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("EndStandardDeviation"));
    v5->_endStandardDeviation = v9;
    v5->_allDays.start = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AllDaysStart"));
    v5->_allDays.duration = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AllDaysDuration"));
    v5->_partiallyLogged = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("PartiallyLogged"));
    v5->_daysOffsetFromCalendarMethod = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("DaysOffsetFromCalendarMethod"));
    v5->_predictionPrimarySource = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("PredictionPrimarySource"));
  }

  return v5;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)mostLikelyDays
{
  double startMean;
  int64_t v3;
  int64_t v4;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  startMean = self->_startMean;
  v3 = llround(self->_endMean - startMean) + 1;
  v4 = llround(startMean);
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

- (int64_t)dayIndexFromStartWithCoefficient:(double)a3
{
  return -[HKMCProjection _dayIndexFromMean:standardDeviation:coefficient:](self, "_dayIndexFromMean:standardDeviation:coefficient:", self->_startMean, self->_startStandardDeviation, a3);
}

- (int64_t)dayIndexFromEndWithCoefficient:(double)a3
{
  return -[HKMCProjection _dayIndexFromMean:standardDeviation:coefficient:](self, "_dayIndexFromMean:standardDeviation:coefficient:", self->_endMean, self->_endStandardDeviation, a3);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)startDayRange
{
  int64_t start;
  int64_t v3;
  int64_t v4;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  start = self->_allDays.start;
  v3 = (2 * (-[HKMCProjection mostLikelyDays](self, "mostLikelyDays") - start)) | 1;
  v4 = start;
  result.var1 = v3;
  result.var0 = v4;
  return result;
}

- (int64_t)_dayIndexFromMean:(double)a3 standardDeviation:(double)a4 coefficient:(double)a5
{
  return llround(a3 + a5 * a4);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  double endMean;
  double endStandardDeviation;
  void *v7;
  _BOOL8 partiallyLogged;
  void *v9;
  void *v10;
  void *v11;
  __int128 v13;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  v13 = *(_OWORD *)&self->_startMean;
  endMean = self->_endMean;
  endStandardDeviation = self->_endStandardDeviation;
  NSStringFromHKDayIndexRange();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  partiallyLogged = self->_partiallyLogged;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_daysOffsetFromCalendarMethod);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_predictionPrimarySource);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p start:%.2f±%.2f end:%.2f±%.2f allDays:%@ partiallyLogged:%d daysShifted:%@ predictionPrimarySource:%@>"), v4, self, v13, *(_QWORD *)&endMean, *(_QWORD *)&endStandardDeviation, v7, partiallyLogged, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)hk_redactedDescription
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@:%p>"), objc_opt_class(), self);
}

- (BOOL)isEqual:(id)a3
{
  HKMCProjection *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v4 = (HKMCProjection *)a3;
  if (self == v4)
  {
    v9 = 1;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || vabdd_f64(self->_startMean, v4->_startMean) >= 2.22044605e-16
    || vabdd_f64(self->_startStandardDeviation, v4->_startStandardDeviation) >= 2.22044605e-16
    || vabdd_f64(self->_endMean, v4->_endMean) >= 2.22044605e-16
    || vabdd_f64(self->_endStandardDeviation, v4->_endStandardDeviation) >= 2.22044605e-16)
  {
    goto LABEL_12;
  }
  v5 = -[HKMCProjection allDays](self, "allDays");
  v7 = v6;
  v9 = 0;
  if (v5 == -[HKMCProjection allDays](v4, "allDays") && v7 == v8)
  {
    if (self->_partiallyLogged == v4->_partiallyLogged
      && self->_daysOffsetFromCalendarMethod == v4->_daysOffsetFromCalendarMethod)
    {
      v9 = self->_predictionPrimarySource == v4->_predictionPrimarySource;
      goto LABEL_14;
    }
LABEL_12:
    v9 = 0;
  }
LABEL_14:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  unint64_t v16;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_startMean);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_startStandardDeviation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_endMean);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_endStandardDeviation);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_allDays.start);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_allDays.duration);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v10 ^ v12 ^ objc_msgSend(v13, "hash") ^ self->_partiallyLogged;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_daysOffsetFromCalendarMethod);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash") ^ self->_predictionPrimarySource;

  return v16;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)allDays
{
  int64_t duration;
  int64_t start;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  duration = self->_allDays.duration;
  start = self->_allDays.start;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (BOOL)isPartiallyLogged
{
  return self->_partiallyLogged;
}

- (int64_t)daysOffsetFromCalendarMethod
{
  return self->_daysOffsetFromCalendarMethod;
}

- (int64_t)predictionPrimarySource
{
  return self->_predictionPrimarySource;
}

- (double)startMean
{
  return self->_startMean;
}

- (double)startStandardDeviation
{
  return self->_startStandardDeviation;
}

- (double)endMean
{
  return self->_endMean;
}

- (double)endStandardDeviation
{
  return self->_endStandardDeviation;
}

- (void)initWithStartMean:(void *)a1 startStandardDeviation:endMean:endStandardDeviation:allDays:partiallyLogged:daysOffsetFromCalendarMethod:predictionPrimarySource:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v3 = 138543362;
  v4 = (id)objc_opt_class();
  v2 = v4;
  _os_log_fault_impl(&dword_218A9C000, v1, OS_LOG_TYPE_FAULT, "[%{public}@] Cannot create projection with most likely days outside of all days", (uint8_t *)&v3, 0xCu);

}

@end
