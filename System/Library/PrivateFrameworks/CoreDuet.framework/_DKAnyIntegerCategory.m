@implementation _DKAnyIntegerCategory

+ (id)type
{
  return +[_DKObjectType objectTypeFromClass:](_DKCategoryType, "objectTypeFromClass:", a1);
}

+ (id)withValue:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "type");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_DKCategory categoryWithInteger:type:](_DKCategory, "categoryWithInteger:type:", a3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
