@implementation NSArray(BMDSLRandomObject)

- (id)bmdsl_randomObject
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "count");
  if (v2)
  {
    objc_msgSend(a1, "objectAtIndex:", arc4random_uniform(objc_msgSend(a1, "count")));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

@end
