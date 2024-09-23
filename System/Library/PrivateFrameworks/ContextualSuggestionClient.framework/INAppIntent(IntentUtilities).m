@implementation INAppIntent(IntentUtilities)

- (id)atx_comparableParameters
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "serializedParameters");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("AppIntentDescriptor"));
  return v2;
}

@end
