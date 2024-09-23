@implementation SAAceDomainSignal(AnalyticsContextVending)

- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending
{
  id v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&off_1EE423DA8;
  v4 = a3;
  objc_msgSendSuper2(&v8, sel_af_addEntriesToAnalyticsContext_, v4);
  objc_msgSend(a1, "domain", v8.receiver, v8.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("nil");
  objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("domain"));

}

@end
