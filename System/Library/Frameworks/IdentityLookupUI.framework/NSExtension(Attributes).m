@implementation NSExtension(Attributes)

- (id)SMSReportDestination
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ILClassificationExtensionSMSReportDestination"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)networkReportDestination
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "attributes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ILClassificationExtensionNetworkReportDestination"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
