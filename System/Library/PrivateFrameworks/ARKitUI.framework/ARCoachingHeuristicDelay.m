@implementation ARCoachingHeuristicDelay

- (ARCoachingHeuristicDelay)initWithDuration:(double)a3
{
  ARCoachingHeuristicDelay *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ARCoachingHeuristicDelay;
  result = -[ARCoachingHeuristicDelay init](&v5, sel_init);
  if (result)
  {
    result->_endTime = -1.0;
    result->_duration = a3;
  }
  return result;
}

- (int64_t)requirements
{
  return -[ARCoachingHeuristic satisfied](self, "satisfied") ^ 1;
}

- (void)updateWithFrame:(id)a3 cache:(id)a4
{
  double v5;
  double v6;
  id v7;

  v7 = a3;
  if (!-[ARCoachingHeuristic satisfied](self, "satisfied"))
  {
    if (self->_endTime < 0.0)
    {
      objc_msgSend(v7, "timestamp");
      self->_endTime = v5 + self->_duration;
    }
    objc_msgSend(v7, "timestamp");
    -[ARCoachingHeuristic setSatisfied:](self, "setSatisfied:", v6 >= self->_endTime);
  }

}

@end
