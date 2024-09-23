@implementation _DASWidgetBudgetMigrationHelper

+ (id)resetWidgetBudgets
{
  void *v2;
  void *v3;

  +[_DASScheduler sharedScheduler](_DASScheduler, "sharedScheduler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_resetWidgetBudgets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
