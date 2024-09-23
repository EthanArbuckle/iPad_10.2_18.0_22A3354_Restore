@implementation _DKMotionCategory

+ (id)type
{
  return +[_DKObjectType objectTypeFromClass:](_DKCategoryType, "objectTypeFromClass:", a1);
}

+ (id)unknown
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)stationary
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", 2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)walking
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", 4, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)running
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", 8, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)cycling
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", 16, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)automotive
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", 32, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)stationaryAutomotive
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", 34, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
