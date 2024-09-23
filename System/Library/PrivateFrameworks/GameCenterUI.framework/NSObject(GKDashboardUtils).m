@implementation NSObject(GKDashboardUtils)

+ (id)_gkPlatformNibName
{
  objc_class *v2;
  void *v3;
  void *v4;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_gkPlatformNibNameForBaseName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (uint64_t)_gkPlatformNibNameForBaseName:()GKDashboardUtils
{
  return objc_msgSend(a3, "stringByAppendingString:", CFSTR("_iOS"));
}

+ (id)_gkNib
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_gkPlatformNibName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_gkNibWithPlatformName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_gkNibWithBaseName:()GKDashboardUtils
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_gkPlatformNibNameForBaseName:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_gkNibWithPlatformName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_gkNibWithPlatformName:()GKDashboardUtils
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "bundleForClass:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3A50], "nibWithNibName:bundle:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
