@implementation NSExtension(TestFlightService)

- (id)testFlightServiceExtensionCustomServiceTime
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("NSExtension"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ASDTestFlightServiceExtensionServiceTime"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
