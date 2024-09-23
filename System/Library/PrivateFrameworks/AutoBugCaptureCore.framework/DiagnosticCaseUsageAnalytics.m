@implementation DiagnosticCaseUsageAnalytics

- (DiagnosticCaseUsageAnalytics)init
{
  void *v3;
  DiagnosticCaseUsageAnalytics *v4;
  objc_super v6;

  +[AnalyticsWorkspace defaultWorkspace](AnalyticsWorkspace, "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)DiagnosticCaseUsageAnalytics;
  v4 = -[ObjectAnalytics initWithWorkspace:entityName:withCache:](&v6, sel_initWithWorkspace_entityName_withCache_, v3, CFSTR("DiagnosticCaseUsage"), 1);

  return v4;
}

- (DiagnosticCaseUsageAnalytics)initWithWorkspace:(id)a3 withCache:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DiagnosticCaseUsageAnalytics;
  return -[ObjectAnalytics initWithWorkspace:entityName:withCache:](&v5, sel_initWithWorkspace_entityName_withCache_, a3, CFSTR("DiagnosticCaseUsage"), a4);
}

@end
