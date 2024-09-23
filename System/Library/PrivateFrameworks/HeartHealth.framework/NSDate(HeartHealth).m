@implementation NSDate(HeartHealth)

+ (id)hkhr_dateWithISO8601String:()HeartHealth
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB36A8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "dateFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)hkhr_ISO8601StringForDate:()HeartHealth
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x1E0CB36A8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
