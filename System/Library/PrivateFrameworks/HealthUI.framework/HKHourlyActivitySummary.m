@implementation HKHourlyActivitySummary

- (id)dateComponentsForCalendar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  v4 = a3;
  -[HKHourlyActivitySummary hourlyDateComponents](self, "hourlyDateComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if (v7)
  {
    -[HKHourlyActivitySummary hourlyDateComponents](self, "hourlyDateComponents");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)_useHourlyGoalComparison
{
  return 1;
}

- (NSDateComponents)hourlyDateComponents
{
  return self->_hourlyDateComponents;
}

- (void)setHourlyDateComponents:(id)a3
{
  objc_storeStrong((id *)&self->_hourlyDateComponents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hourlyDateComponents, 0);
}

@end
