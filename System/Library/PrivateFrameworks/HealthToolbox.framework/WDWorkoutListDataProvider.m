@implementation WDWorkoutListDataProvider

- (id)sampleTypes
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD3DC0], "workoutType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[WDSampleListDataProvider samples](self, "samples", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") < 1)
  {
    v5 = &stru_24D38E7C8;
  }
  else
  {
    WDBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("WORKOUTS"), &stru_24D38E7C8, CFSTR("WellnessDashboard-Localizable"));
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)textForObject:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a3, "duration");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WDWorkoutListDataProvider timePeriodFormatter](self, "timePeriodFormatter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromNumber:displayType:unitController:", v5, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)timePeriodFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)timePeriodFormatter___formatter;
  if (!timePeriodFormatter___formatter)
  {
    v3 = objc_alloc_init(MEMORY[0x24BE4A938]);
    v4 = (void *)timePeriodFormatter___formatter;
    timePeriodFormatter___formatter = (uint64_t)v3;

    v2 = (void *)timePeriodFormatter___formatter;
  }
  return v2;
}

@end
