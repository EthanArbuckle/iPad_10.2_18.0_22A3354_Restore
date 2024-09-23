@implementation _BMOSAnalyticsLibraryNode

+ (id)identifier
{
  return CFSTR("OSAnalytics");
}

+ (id)CA
{
  return (id)objc_opt_class();
}

+ (id)Hardware
{
  return (id)objc_opt_class();
}

+ (id)Stability
{
  return (id)objc_opt_class();
}

+ (id)streamNames
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)validKeyPaths
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

+ (id)streamWithName:(id)a3
{
  return 0;
}

+ (id)sublibraries
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "CA");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "Hardware", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(a1, "Stability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
