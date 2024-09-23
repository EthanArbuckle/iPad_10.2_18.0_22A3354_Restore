@implementation SAUIDialogPunchout(AnalyticsContextVending)

- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&off_1EE422BD0;
  objc_msgSendSuper2(&v8, sel_af_addEntriesToAnalyticsContext_, v4);
  objc_msgSend(a1, "utteranceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "af_analyticsContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("utteranceView"));

  }
}

- (id)af_dialogIdentifiersForAnalyticsContext
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "utteranceView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "af_dialogIdentifiersForAnalyticsContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
