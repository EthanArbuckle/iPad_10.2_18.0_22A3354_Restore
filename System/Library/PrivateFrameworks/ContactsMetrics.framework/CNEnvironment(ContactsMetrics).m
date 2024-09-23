@implementation CNEnvironment(ContactsMetrics)

- (uint64_t)metricsReporter
{
  return objc_msgSend(a1, "valueForKey:onCacheMiss:", CFSTR("metrics-reporter"), &__block_literal_global);
}

@end
