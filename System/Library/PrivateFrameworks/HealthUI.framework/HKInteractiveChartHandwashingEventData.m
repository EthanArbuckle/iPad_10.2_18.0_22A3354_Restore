@implementation HKInteractiveChartHandwashingEventData

- (HKInteractiveChartHandwashingEventData)initWithTimePeriod:(double)a3 meetsGoal:(BOOL)a4
{
  _BOOL8 v4;
  HKInteractiveChartHandwashingEventData *v6;
  HKInteractiveChartHandwashingEventData *v7;
  objc_super v9;

  v4 = a4;
  v9.receiver = self;
  v9.super_class = (Class)HKInteractiveChartHandwashingEventData;
  v6 = -[HKInteractiveChartHandwashingEventData init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    -[HKInteractiveChartTimePeriodData setTimePeriod:](v6, "setTimePeriod:", a3);
    -[HKInteractiveChartHandwashingEventData setMeetsGoal:](v7, "setMeetsGoal:", v4);
  }
  return v7;
}

- (BOOL)meetsGoal
{
  return self->_meetsGoal;
}

- (void)setMeetsGoal:(BOOL)a3
{
  self->_meetsGoal = a3;
}

@end
