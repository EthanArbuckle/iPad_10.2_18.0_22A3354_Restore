@implementation HDKeyValueDomain(HKMCDeviceLocalProtected)

+ (id)hdmc_deviationDetectionAnalyticsProtectedDomainWithProfile:()HKMCDeviceLocalProtected
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BE40AD0];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithCategory:domainName:profile:", 100, *MEMORY[0x24BE468E0], v4);

  return v6;
}

@end
