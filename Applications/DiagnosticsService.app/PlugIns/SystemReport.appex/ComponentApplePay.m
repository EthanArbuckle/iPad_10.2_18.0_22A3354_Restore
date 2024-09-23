@implementation ComponentApplePay

- (BOOL)isPresent
{
  io_service_t MatchingService;
  const __CFDictionary *v3;

  MatchingService = +[DASoftLinking isNearFieldFrameworkAvailable](DASoftLinking, "isNearFieldFrameworkAvailable");
  if (MatchingService)
  {
    v3 = IOServiceMatching("AppleStockholmControl");
    MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v3);
    if (MatchingService)
    {
      IOObjectRelease(MatchingService);
      LOBYTE(MatchingService) = 1;
    }
  }
  return MatchingService;
}

- (void)populateAttributes:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class embeddedSecureElement](+[DASoftLinking nearFieldClass:](DASoftLinking, "nearFieldClass:", CFSTR("NFSecureElement")), "embeddedSecureElement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serialNumber"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "serialNumber"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("serialNumber"));

  }
}

@end
