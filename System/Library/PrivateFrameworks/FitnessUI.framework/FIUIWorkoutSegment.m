@implementation FIUIWorkoutSegment

- (id)formattedDurationValueWithFormattingManager:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[FIUIWorkoutSegment elapsedTime](self, "elapsedTime");
  objc_msgSend(v4, "stringWithDuration:durationFormat:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)formattedActiveEnergyValueForUnit:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[FIUIWorkoutSegment activeEnergy](self, "activeEnergy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v4);
  v7 = v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FIUIFormattingManager stringWithNumber:decimalPrecision:](FIUIFormattingManager, "stringWithNumber:decimalPrecision:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)_decimalNumberFormatter
{
  if (_decimalNumberFormatter_onceToken != -1)
    dispatch_once(&_decimalNumberFormatter_onceToken, &__block_literal_global_16);
  return (id)_decimalNumberFormatter_formatter;
}

uint64_t __45__FIUIWorkoutSegment__decimalNumberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)_decimalNumberFormatter_formatter;
  _decimalNumberFormatter_formatter = (uint64_t)v0;

  objc_msgSend((id)_decimalNumberFormatter_formatter, "setMinimumFractionDigits:", 0);
  objc_msgSend((id)_decimalNumberFormatter_formatter, "setMaximumFractionDigits:", 2);
  return objc_msgSend((id)_decimalNumberFormatter_formatter, "setNumberStyle:", 1);
}

- (id)formattedDistanceValueForUnit:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[FIUIWorkoutSegment distance](self, "distance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v4);
  v7 = v6;

  objc_msgSend((id)objc_opt_class(), "_decimalNumberFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringFromNumber:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)formattedPaceUsingFormatType:(int64_t)a3 formattingManager:(id)a4 distanceType:(unint64_t)a5
{
  id v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;

  v8 = a4;
  -[FIUIWorkoutSegment elapsedTime](self, "elapsedTime");
  v10 = v9;
  if (fabs(v9) < 2.22044605e-16)
  {
    -[FIUIWorkoutSegment endDate](self, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIWorkoutSegment startDate](self, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v12);
    v10 = v13;

  }
  -[FIUIWorkoutSegment distance](self, "distance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedPaceStringWithDistance:overDuration:paceFormat:distanceType:", v14, a3, a5, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v14.receiver = self;
  v14.super_class = (Class)FIUIWorkoutSegment;
  -[FIUIWorkoutSegment description](&v14, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[FIUIWorkoutSegment elapsedTime](self, "elapsedTime");
  objc_msgSend(v5, "numberWithDouble:", v6 / 60.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "kilocalorieUnit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSegment formattedActiveEnergyValueForUnit:](self, "formattedActiveEnergyValueForUnit:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "mileUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSegment formattedDistanceValueForUnit:](self, "formattedDistanceValueForUnit:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Duration: %@ min; Energy: %@; Distance: %@"), v4, v7, v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (HKQuantity)activeEnergy
{
  return self->_activeEnergy;
}

- (void)setActiveEnergy:(id)a3
{
  objc_storeStrong((id *)&self->_activeEnergy, a3);
}

- (HKQuantity)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
  objc_storeStrong((id *)&self->_distance, a3);
}

- (double)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(double)a3
{
  self->_elapsedTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_activeEnergy, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
