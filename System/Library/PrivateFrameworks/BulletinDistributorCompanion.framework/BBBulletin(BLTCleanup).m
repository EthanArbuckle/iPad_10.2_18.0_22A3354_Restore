@implementation BBBulletin(BLTCleanup)

- (id)bltContext
{
  void *v1;
  void *v2;
  id v3;
  id v4;

  objc_msgSend(a1, "context");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("BLTWatchLegacyMap"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (id)objc_msgSend(v1, "mutableCopy");

    objc_msgSend(v3, "removeObjectForKey:", CFSTR("BLTWatchLegacyMap"));
    v1 = v3;
  }
  else
  {
    v3 = 0;
  }
  v4 = v1;

  return v4;
}

@end
