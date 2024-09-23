@implementation AMSFollowUpMetricsEvent

+ (id)eventFromMetricsDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithTopic:", CFSTR("xp_amp_followup"));
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "addPropertiesWithDictionary:", v3);

  return v5;
}

@end
