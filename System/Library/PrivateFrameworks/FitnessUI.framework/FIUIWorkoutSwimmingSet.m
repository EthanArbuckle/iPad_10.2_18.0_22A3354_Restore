@implementation FIUIWorkoutSwimmingSet

- (double)_activeDuration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[FIUIWorkoutSwimmingSet movementEndDate](self, "movementEndDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSwimmingSet startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (double)_restingDuration
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[FIUIWorkoutSwimmingSet endDate](self, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSwimmingSet movementEndDate](self, "movementEndDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5;

  return v6;
}

- (id)formattedActiveDurationWithFormattingManager:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[FIUIWorkoutSwimmingSet _activeDuration](self, "_activeDuration");
  objc_msgSend(v4, "stringWithDuration:durationFormat:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)formattedRestDurationWithFormattingManager:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[FIUIWorkoutSwimmingSet _restingDuration](self, "_restingDuration");
  objc_msgSend(v4, "stringWithDuration:durationFormat:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_decimalNumberFormatter
{
  if (_decimalNumberFormatter_onceToken_0 != -1)
    dispatch_once(&_decimalNumberFormatter_onceToken_0, &__block_literal_global_18);
  return (id)_decimalNumberFormatter_formatter_0;
}

uint64_t __49__FIUIWorkoutSwimmingSet__decimalNumberFormatter__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  v1 = (void *)_decimalNumberFormatter_formatter_0;
  _decimalNumberFormatter_formatter_0 = (uint64_t)v0;

  objc_msgSend((id)_decimalNumberFormatter_formatter_0, "setMinimumFractionDigits:", 0);
  objc_msgSend((id)_decimalNumberFormatter_formatter_0, "setMaximumFractionDigits:", 2);
  return objc_msgSend((id)_decimalNumberFormatter_formatter_0, "setNumberStyle:", 1);
}

- (id)formattedDistanceValueWithFormattingManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[FIUIWorkoutSwimmingSet distance](self, "distance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v6);
  objc_msgSend(v4, "localizedStringWithDistanceInMeters:distanceType:unitStyle:", 3, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)formattedPaceUsingFormatType:(int64_t)a3 formattingManager:(id)a4
{
  id v6;
  double v7;
  double v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[FIUIWorkoutSwimmingSet _activeDuration](self, "_activeDuration");
  v8 = v7;
  -[FIUIWorkoutSwimmingSet distance](self, "distance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedSwimmingPaceStringWithDistance:overDuration:paceFormat:", v9, a3, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)formattedStrokeCountUsingFormatType:(int64_t)a3 formattingManager:(id)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = -[FIUIWorkoutSwimmingSet strokeCount](self, "strokeCount");
  -[FIUIWorkoutSwimmingSet distance](self, "distance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStrokeCountStringWithCount:overDistance:paceFormat:", v7, v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)formattedDominantStrokeStyle
{
  return (id)FIUILocalizedStrokeStyleName(-[FIUIWorkoutSwimmingSet dominantStrokeStyle](self, "dominantStrokeStyle"));
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
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v12.receiver = self;
  v12.super_class = (Class)FIUIWorkoutSwimmingSet;
  -[FIUIWorkoutSwimmingSet description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSwimmingSet startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSwimmingSet endDate](self, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIWorkoutSwimmingSet distance](self, "distance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FIUIWorkoutSwimmingSet strokeCount](self, "strokeCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FIUIWorkoutSwimmingSet dominantStrokeStyle](self, "dominantStrokeStyle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: Start: %@; End: %@; Distance: %@; Stroke Count: %@; Stroke Style: %@"),
    v4,
    v5,
    v6,
    v7,
    v8,
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (NSDate)movementEndDate
{
  return self->_movementEndDate;
}

- (void)setMovementEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_movementEndDate, a3);
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (void)setEndDate:(id)a3
{
  objc_storeStrong((id *)&self->_endDate, a3);
}

- (int64_t)dominantStrokeStyle
{
  return self->_dominantStrokeStyle;
}

- (void)setDominantStrokeStyle:(int64_t)a3
{
  self->_dominantStrokeStyle = a3;
}

- (int64_t)strokeCount
{
  return self->_strokeCount;
}

- (void)setStrokeCount:(int64_t)a3
{
  self->_strokeCount = a3;
}

- (HKQuantity)distance
{
  return self->_distance;
}

- (void)setDistance:(id)a3
{
  objc_storeStrong((id *)&self->_distance, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distance, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_movementEndDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
