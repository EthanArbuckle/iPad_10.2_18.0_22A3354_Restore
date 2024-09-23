@implementation AMSBagKeySet(MetricsKit)

+ (void)registerBagKeySetForMetricsConfiguration:()MetricsKit
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v7 = (id)objc_opt_new();
  objc_msgSend(v7, "addBagKey:valueType:", CFSTR("metrics"), 6);
  v4 = (void *)MEMORY[0x24BE08058];
  objc_msgSend(v3, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profileVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "registerBagKeySet:forProfile:profileVersion:", v7, v5, v6);
}

+ (void)registerBagKeySetForMetricsRecorder:()MetricsKit
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x24BE08258];
  v4 = a3;
  objc_msgSend(v3, "bagKeySet");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BE08058];
  objc_msgSend(v4, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "registerBagKeySet:forProfile:profileVersion:", v8, v6, v7);
}

@end
