@implementation SAAceView(AnalyticsContextVending)

- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  v8.receiver = a1;
  v8.super_class = (Class)&off_1EE421FC8;
  objc_msgSendSuper2(&v8, sel_af_addEntriesToAnalyticsContext_, v4);
  objc_msgSend(a1, "viewId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("viewId"));
  objc_msgSend(a1, "dialog");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dialogIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("dialogIdentifier"));

}

- (id)af_dialogIdentifiersForAnalyticsContext
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "dialog");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dialogIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v5[0] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end
