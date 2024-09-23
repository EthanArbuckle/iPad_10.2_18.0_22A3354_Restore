@implementation HAMenstrualAlgorithmsPrediction

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAMenstrualAlgorithmsPrediction)initWithCoder:(id)a3
{
  id v4;
  HAMenstrualAlgorithmsPrediction *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSUInteger v18;
  void *v19;
  void *v20;
  void *v21;
  HAMenstrualAlgorithmsPrediction *v22;

  v4 = a3;
  v5 = -[HAMenstrualAlgorithmsPrediction init](self, "init");
  if (v5)
  {
    NSStringFromSelector(sel_julianDayOfWindowStart);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_julianDayOfWindowStart = objc_msgSend(v4, "decodeInt32ForKey:", v6);

    NSStringFromSelector(sel_startProbabilityMean);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v7);
    v5->_startProbabilityMean = v8;

    NSStringFromSelector(sel_endProbabilityMean);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v9);
    v5->_endProbabilityMean = v10;

    NSStringFromSelector(sel_startProbabilityStdDev);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v11);
    v5->_startProbabilityStdDev = v12;

    NSStringFromSelector(sel_endProbabilityStdDev);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeDoubleForKey:", v13);
    v5->_endProbabilityStdDev = v14;

    v15 = objc_opt_class();
    NSStringFromSelector(sel_lowRange);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v5->_lowRange.location = objc_msgSend(v17, "rangeValue");
    v5->_lowRange.length = v18;
    NSStringFromSelector(sel_isOngoingMenstruation);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_isOngoingMenstruation = objc_msgSend(v4, "decodeBoolForKey:", v19);

    NSStringFromSelector(sel_predictionPrimarySource);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_predictionPrimarySource = objc_msgSend(v4, "decodeInt32ForKey:", v20);

    NSStringFromSelector(sel_daysOffsetFromCalendarMethod);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_daysOffsetFromCalendarMethod = objc_msgSend(v4, "decodeIntegerForKey:", v21);

    v22 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t julianDayOfWindowStart;
  void *v5;
  double startProbabilityMean;
  void *v7;
  double endProbabilityMean;
  void *v9;
  double startProbabilityStdDev;
  void *v11;
  double endProbabilityStdDev;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t predictionPrimarySource;
  void *v18;
  int64_t daysOffsetFromCalendarMethod;
  void *v20;
  id v21;

  v21 = a3;
  julianDayOfWindowStart = self->_julianDayOfWindowStart;
  NSStringFromSelector(sel_julianDayOfWindowStart);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeInt32:forKey:", julianDayOfWindowStart, v5);

  startProbabilityMean = self->_startProbabilityMean;
  NSStringFromSelector(sel_startProbabilityMean);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeDouble:forKey:", v7, startProbabilityMean);

  endProbabilityMean = self->_endProbabilityMean;
  NSStringFromSelector(sel_endProbabilityMean);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeDouble:forKey:", v9, endProbabilityMean);

  startProbabilityStdDev = self->_startProbabilityStdDev;
  NSStringFromSelector(sel_startProbabilityStdDev);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeDouble:forKey:", v11, startProbabilityStdDev);

  endProbabilityStdDev = self->_endProbabilityStdDev;
  NSStringFromSelector(sel_endProbabilityStdDev);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeDouble:forKey:", v13, endProbabilityStdDev);

  objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", self->_lowRange.location, self->_lowRange.length);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_lowRange);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeObject:forKey:", v14, v15);

  LODWORD(v15) = self->_isOngoingMenstruation;
  NSStringFromSelector(sel_isOngoingMenstruation);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeBool:forKey:", (_DWORD)v15 != 0, v16);

  predictionPrimarySource = self->_predictionPrimarySource;
  NSStringFromSelector(sel_predictionPrimarySource);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeInt32:forKey:", predictionPrimarySource, v18);

  daysOffsetFromCalendarMethod = self->_daysOffsetFromCalendarMethod;
  NSStringFromSelector(sel_daysOffsetFromCalendarMethod);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "encodeInteger:forKey:", daysOffsetFromCalendarMethod, v20);

}

- (unsigned)julianDayOfWindowStart
{
  return self->_julianDayOfWindowStart;
}

- (void)setJulianDayOfWindowStart:(unsigned int)a3
{
  self->_julianDayOfWindowStart = a3;
}

- (double)startProbabilityMean
{
  return self->_startProbabilityMean;
}

- (void)setStartProbabilityMean:(double)a3
{
  self->_startProbabilityMean = a3;
}

- (double)endProbabilityMean
{
  return self->_endProbabilityMean;
}

- (void)setEndProbabilityMean:(double)a3
{
  self->_endProbabilityMean = a3;
}

- (double)startProbabilityStdDev
{
  return self->_startProbabilityStdDev;
}

- (void)setStartProbabilityStdDev:(double)a3
{
  self->_startProbabilityStdDev = a3;
}

- (double)endProbabilityStdDev
{
  return self->_endProbabilityStdDev;
}

- (void)setEndProbabilityStdDev:(double)a3
{
  self->_endProbabilityStdDev = a3;
}

- (_NSRange)lowRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_lowRange.length;
  location = self->_lowRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setLowRange:(_NSRange)a3
{
  self->_lowRange = a3;
}

- (BOOL)isOngoingMenstruation
{
  return self->_isOngoingMenstruation;
}

- (void)setIsOngoingMenstruation:(BOOL)a3
{
  self->_isOngoingMenstruation = a3;
}

- (unsigned)predictionPrimarySource
{
  return self->_predictionPrimarySource;
}

- (void)setPredictionPrimarySource:(unsigned __int8)a3
{
  self->_predictionPrimarySource = a3;
}

- (int64_t)daysOffsetFromCalendarMethod
{
  return self->_daysOffsetFromCalendarMethod;
}

- (void)setDaysOffsetFromCalendarMethod:(int64_t)a3
{
  self->_daysOffsetFromCalendarMethod = a3;
}

@end
