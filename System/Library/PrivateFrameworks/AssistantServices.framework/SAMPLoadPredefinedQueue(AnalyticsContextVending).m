@implementation SAMPLoadPredefinedQueue(AnalyticsContextVending)

- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = a1;
  v7.super_class = (Class)&off_1EE424CF0;
  objc_msgSendSuper2(&v7, sel_af_addEntriesToAnalyticsContext_, v4);
  objc_msgSend(a1, "hashedRouteUIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    objc_msgSend(v4, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("isWHA"));

}

@end
