@implementation FIUIWorkoutSwimmingSplit

- (double)_fractionToFillTotalSplitDistance
{
  double v3;
  double v4;

  v3 = (double)-[FIUIWorkoutSwimmingSplit splitDistance](self, "splitDistance");
  -[FIUIWorkoutSwimmingSplit distanceInUserUnit](self, "distanceInUserUnit");
  return v3 / v4;
}

- (int64_t)strokeCountScaledToFillSplit
{
  double v3;

  -[FIUIWorkoutSwimmingSplit _fractionToFillTotalSplitDistance](self, "_fractionToFillTotalSplitDistance");
  return llround(v3 * (double)-[FIUIWorkoutSwimmingSplit strokeCount](self, "strokeCount"));
}

- (double)durationScaledToFillSplit
{
  double v3;
  double v4;
  double v5;

  -[FIUIWorkoutSwimmingSplit duration](self, "duration");
  v4 = v3;
  -[FIUIWorkoutSwimmingSplit _fractionToFillTotalSplitDistance](self, "_fractionToFillTotalSplitDistance");
  return v4 * v5;
}

- (id)formattedStrokeCount
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FIUIWorkoutSwimmingSplit strokeCountScaledToFillSplit](self, "strokeCountScaledToFillSplit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[FIUIFormattingManager stringWithNumber:decimalPrecision:](FIUIFormattingManager, "stringWithNumber:decimalPrecision:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)formattedPaceWithFormattingManager:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[FIUIWorkoutSwimmingSplit durationScaledToFillSplit](self, "durationScaledToFillSplit");
  objc_msgSend(v4, "stringWithDuration:durationFormat:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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
  objc_super v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v11.receiver = self;
  v11.super_class = (Class)FIUIWorkoutSwimmingSplit;
  -[FIUIWorkoutSwimmingSplit description](&v11, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  -[FIUIWorkoutSwimmingSplit duration](self, "duration");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FIUIWorkoutSwimmingSplit splitDistance](self, "splitDistance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[FIUIWorkoutSwimmingSplit strokeCount](self, "strokeCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %@ seconds, %@ m/yd, %@ strokes"), v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (int64_t)splitDistance
{
  return self->_splitDistance;
}

- (void)setSplitDistance:(int64_t)a3
{
  self->_splitDistance = a3;
}

- (double)distanceInUserUnit
{
  return self->_distanceInUserUnit;
}

- (void)setDistanceInUserUnit:(double)a3
{
  self->_distanceInUserUnit = a3;
}

- (int64_t)strokeCount
{
  return self->_strokeCount;
}

- (void)setStrokeCount:(int64_t)a3
{
  self->_strokeCount = a3;
}

- (void)setStrokeCountScaledToFillSplit:(int64_t)a3
{
  self->_strokeCountScaledToFillSplit = a3;
}

- (void)setDurationScaledToFillSplit:(double)a3
{
  self->_durationScaledToFillSplit = a3;
}

@end
