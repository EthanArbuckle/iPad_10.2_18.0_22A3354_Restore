@implementation CNAutocompleteNetworkActivityPolicy

+ (id)policyWithNoDelay
{
  return objc_alloc_init(CNAutocompleteNetworkActivityPolicy);
}

+ (id)policyWithThrottlingDelayForString:(id)a3
{
  id v3;
  CNAutocompleteNetworkActivityThrottlingPolicy *v4;

  v3 = a3;
  v4 = -[CNAutocompleteNetworkActivityThrottlingPolicy initWithString:]([CNAutocompleteNetworkActivityThrottlingPolicy alloc], "initWithString:", v3);

  return v4;
}

- (BOOL)shouldSearchServers
{
  return 1;
}

- (double)delayBeforeBeginningNetworkActivity
{
  return 0.0;
}

@end
