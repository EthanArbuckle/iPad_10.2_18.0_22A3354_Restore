@implementation SABaseAceObject(AnalyticsContextVending)

- (void)af_addEntriesToAnalyticsContext:()AnalyticsContextVending
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  objc_super v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = a1;
  v12.super_class = (Class)&off_1EE41DCD0;
  objc_msgSendSuper2(&v12, sel_af_addEntriesToAnalyticsContext_, v4);
  objc_msgSend(a1, "metricsContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0CB36D8];
    objc_msgSend(v5, "dataUsingEncoding:", 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    objc_msgSend(v7, "JSONObjectWithData:options:error:", v8, 0, &v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;

    if (!v9 || v10)
    {
      objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("metricsContext"));
    }
    else
    {
      objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("metricsContext"));
      v10 = 0;
    }

  }
}

@end
