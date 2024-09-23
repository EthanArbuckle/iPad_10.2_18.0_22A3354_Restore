@implementation ARCoachingHeuristicHorizontalPlane

- (int64_t)requirements
{
  if (-[ARCoachingHeuristic satisfied](self, "satisfied"))
    return 0;
  else
    return 2;
}

- (void)updateWithFrame:(id)a3 cache:(id)a4
{
  -[ARCoachingHeuristic setSatisfied:](self, "setSatisfied:", objc_msgSend(a4, "hasHorizontalPlane:", a3));
}

@end
