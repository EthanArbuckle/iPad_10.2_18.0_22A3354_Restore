@implementation AMSBag(MetricsKit)

+ (id)metricsAMSBagWithProfileName:()MetricsKit profileVersion:
{
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;

  if (a3)
    v5 = a3;
  else
    v5 = CFSTR("MTMetricsKit");
  if (a4)
    v6 = a4;
  else
    v6 = CFSTR("1");
  v7 = (void *)MEMORY[0x24BE08048];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "bagForProfile:profileVersion:", v5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (uint64_t)metricsDictionary
{
  return objc_msgSend(a1, "dictionaryForKey:", CFSTR("metrics"));
}

- (uint64_t)trustedDomains
{
  return objc_msgSend(a1, "arrayForKey:", CFSTR("trustedDomains"));
}

- (uint64_t)mescalCertificateURL
{
  return objc_msgSend(a1, "URLForKey:", CFSTR("sign-sap-setup-cert"));
}

- (uint64_t)mescalSetupURL
{
  return objc_msgSend(a1, "URLForKey:", CFSTR("sign-sap-setup"));
}

- (uint64_t)mescalPrimingURL
{
  return objc_msgSend(a1, "URLForKey:", CFSTR("primeUrl"));
}

- (uint64_t)mescalSignedActions
{
  return objc_msgSend(a1, "dictionaryForKey:", CFSTR("signed-actions"));
}

- (uint64_t)mescalSignSapRequests
{
  return objc_msgSend(a1, "dictionaryForKey:", CFSTR("sign-sap-request"));
}

- (uint64_t)mescalSignSapResponses
{
  return objc_msgSend(a1, "dictionaryForKey:", CFSTR("sign-sap-response"));
}

@end
