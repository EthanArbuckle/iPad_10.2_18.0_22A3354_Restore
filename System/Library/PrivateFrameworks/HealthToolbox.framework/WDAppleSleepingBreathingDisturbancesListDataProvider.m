@implementation WDAppleSleepingBreathingDisturbancesListDataProvider

- (id)textForObject:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BE4A870];
  objc_msgSend(a3, "quantity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedTitleForBreathingDisturbances:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)secondaryTextForObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  HKDateFormatterFromTemplate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)titleForSection:(unint64_t)a3
{
  return 0;
}

@end
