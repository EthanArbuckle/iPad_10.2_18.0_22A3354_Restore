@implementation NSArray(AXEventPathInfoRepresentationExtension)

- (id)firstPath
{
  void *v2;
  void *v3;
  char isKindOfClass;

  v2 = (void *)objc_msgSend(a1, "count");
  if (v2)
  {
    objc_msgSend(a1, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    v2 = 0;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(a1, "objectAtIndex:", 0);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v2;
}

- (id)secondPath
{
  void *v2;
  char isKindOfClass;
  void *v4;

  if ((unint64_t)objc_msgSend(a1, "count") >= 2
    && (objc_msgSend(a1, "objectAtIndex:", 1),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v2,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(a1, "objectAtIndex:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end
