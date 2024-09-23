@implementation _DOCViewStyleSelectorAXIdentifier

+ (id)idBase
{
  return CFSTR("DOC.viewStyleSelector");
}

+ (NSString)grid
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "idBase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v2, CFSTR("grid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)list
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "idBase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v2, CFSTR("list"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (NSString)column
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "idBase");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(v2, CFSTR("column"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

@end
