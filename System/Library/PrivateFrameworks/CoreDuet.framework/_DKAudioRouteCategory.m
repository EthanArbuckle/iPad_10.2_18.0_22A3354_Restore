@implementation _DKAudioRouteCategory

+ (id)type
{
  return +[_DKObjectType objectTypeFromClass:](_DKCategoryType, "objectTypeFromClass:", a1);
}

+ (id)internal
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", 0, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)external
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "type");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
