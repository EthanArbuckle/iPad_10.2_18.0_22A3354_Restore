@implementation NSSet(BMDSLRandomObject)

- (id)_bmdsl_randomObjectForKey:()BMDSLRandomObject
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "allObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bmdsl_randomObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
