@implementation NSString(SKAdNetworkAdditions)

- (uint64_t)skan_version
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("[.,]"), CFSTR("."), 1024, 0, objc_msgSend(a1, "length"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (skan_version_onceToken != -1)
    dispatch_once(&skan_version_onceToken, &__block_literal_global_0);
  objc_msgSend((id)skan_version_versionMap, "objectForKeyedSubscript:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = 0;

  return v4;
}

+ (const)skan_versionStringFromSKAdNetworkVersion:()SKAdNetworkAdditions
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;

  v3 = CFSTR("2.2");
  v4 = CFSTR("3.0");
  v5 = CFSTR("4.0");
  if (a3 != 400)
    v5 = 0;
  if (a3 != 300)
    v4 = v5;
  if (a3 != 202)
    v3 = v4;
  v6 = CFSTR("2.1");
  if (a3 != 201)
    v6 = 0;
  if (a3 == 200)
    v6 = CFSTR("2.0");
  if (a3 == 100)
    v6 = CFSTR("1.0");
  if (a3 <= 201)
    return v6;
  else
    return v3;
}

@end
