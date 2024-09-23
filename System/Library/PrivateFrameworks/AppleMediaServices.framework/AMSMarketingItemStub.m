@implementation AMSMarketingItemStub

+ (id)stubForServiceType:(id)a3 placement:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[AMSDefaults marketingItemOverrides](AMSDefaults, "marketingItemOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKeyPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  if (v7)
    v8 = v7;
  else
    v8 = (void *)MEMORY[0x1E0C9AA70];
  v9 = v8;

  return v9;
}

@end
