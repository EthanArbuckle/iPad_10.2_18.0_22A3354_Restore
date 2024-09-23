@implementation _HKSleepDaySummaryDurations

- (_HKSleepDaySummaryDurations)initWithInBedDuration:(double)a3 sleepDuration:(double)a4 unspecifiedSleepDuration:(double)a5 coreSleepDuration:(double)a6 deepSleepDuration:(double)a7 remSleepDuration:(double)a8 awakeDuration:(double)a9
{
  _HKSleepDaySummaryDurations *result;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)_HKSleepDaySummaryDurations;
  result = -[_HKSleepDaySummaryDurations init](&v17, sel_init);
  if (result)
  {
    result->_inBedDuration = a3;
    result->_sleepDuration = a4;
    result->_unspecifiedSleepDuration = a5;
    result->_coreSleepDuration = a6;
    result->_deepSleepDuration = a7;
    result->_remSleepDuration = a8;
    result->_awakeDuration = a9;
  }
  return result;
}

+ (id)durationsFromSleepPeriod:(id)a3 dateInterval:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "durationForCategory:overlappingDateInterval:", 1, v5);
  v8 = v7;
  objc_msgSend(v6, "durationForCategory:overlappingDateInterval:", 3, v5);
  v10 = v9;
  objc_msgSend(v6, "durationForCategory:overlappingDateInterval:", 4, v5);
  v12 = v11;
  objc_msgSend(v6, "durationForCategory:overlappingDateInterval:", 5, v5);
  v14 = v13;
  objc_msgSend(v6, "durationForCategory:overlappingDateInterval:", 2, v5);
  v16 = v15;
  objc_msgSend(v6, "durationForCategory:overlappingDateInterval:", 0, v5);
  v18 = v17;

  return -[_HKSleepDaySummaryDurations initWithInBedDuration:sleepDuration:unspecifiedSleepDuration:coreSleepDuration:deepSleepDuration:remSleepDuration:awakeDuration:]([_HKSleepDaySummaryDurations alloc], "initWithInBedDuration:sleepDuration:unspecifiedSleepDuration:coreSleepDuration:deepSleepDuration:remSleepDuration:awakeDuration:", v18, v8 + v10 + v12 + v14, v8, v10, v12, v14, v16);
}

- (id)durationsByAdding:(id)a3
{
  id v4;
  _HKSleepDaySummaryDurations *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;

  v4 = a3;
  v5 = [_HKSleepDaySummaryDurations alloc];
  -[_HKSleepDaySummaryDurations inBedDuration](self, "inBedDuration");
  v7 = v6;
  objc_msgSend(v4, "inBedDuration");
  v9 = v7 + v8;
  -[_HKSleepDaySummaryDurations sleepDuration](self, "sleepDuration");
  v11 = v10;
  objc_msgSend(v4, "sleepDuration");
  v13 = v11 + v12;
  -[_HKSleepDaySummaryDurations unspecifiedSleepDuration](self, "unspecifiedSleepDuration");
  v15 = v14;
  objc_msgSend(v4, "unspecifiedSleepDuration");
  v17 = v15 + v16;
  -[_HKSleepDaySummaryDurations coreSleepDuration](self, "coreSleepDuration");
  v19 = v18;
  objc_msgSend(v4, "coreSleepDuration");
  v21 = v19 + v20;
  -[_HKSleepDaySummaryDurations deepSleepDuration](self, "deepSleepDuration");
  v23 = v22;
  objc_msgSend(v4, "deepSleepDuration");
  v25 = v23 + v24;
  -[_HKSleepDaySummaryDurations remSleepDuration](self, "remSleepDuration");
  v27 = v26;
  objc_msgSend(v4, "remSleepDuration");
  v29 = v27 + v28;
  -[_HKSleepDaySummaryDurations awakeDuration](self, "awakeDuration");
  v31 = v30;
  objc_msgSend(v4, "awakeDuration");
  v33 = v32;

  return -[_HKSleepDaySummaryDurations initWithInBedDuration:sleepDuration:unspecifiedSleepDuration:coreSleepDuration:deepSleepDuration:remSleepDuration:awakeDuration:](v5, "initWithInBedDuration:sleepDuration:unspecifiedSleepDuration:coreSleepDuration:deepSleepDuration:remSleepDuration:awakeDuration:", v9, v13, v17, v21, v25, v29, v31 + v33);
}

- (double)maxDuration
{
  double v3;
  double v4;
  double result;

  -[_HKSleepDaySummaryDurations sleepDuration](self, "sleepDuration");
  v4 = v3;
  -[_HKSleepDaySummaryDurations inBedDuration](self, "inBedDuration");
  if (v4 >= result)
    return v4;
  return result;
}

- (double)inBedDuration
{
  return self->_inBedDuration;
}

- (double)sleepDuration
{
  return self->_sleepDuration;
}

- (double)unspecifiedSleepDuration
{
  return self->_unspecifiedSleepDuration;
}

- (double)coreSleepDuration
{
  return self->_coreSleepDuration;
}

- (double)deepSleepDuration
{
  return self->_deepSleepDuration;
}

- (double)remSleepDuration
{
  return self->_remSleepDuration;
}

- (double)awakeDuration
{
  return self->_awakeDuration;
}

@end
