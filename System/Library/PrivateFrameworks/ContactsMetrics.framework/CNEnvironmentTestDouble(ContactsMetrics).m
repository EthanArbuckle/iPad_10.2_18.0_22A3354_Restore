@implementation CNEnvironmentTestDouble(ContactsMetrics)

- (uint64_t)setMetricsReporter:()ContactsMetrics
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("metrics-reporter"));
}

@end
