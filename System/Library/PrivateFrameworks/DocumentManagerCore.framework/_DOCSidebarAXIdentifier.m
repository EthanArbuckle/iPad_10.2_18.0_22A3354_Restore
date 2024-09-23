@implementation _DOCSidebarAXIdentifier

+ (NSString)containerView
{
  return (NSString *)CFSTR("Browse View");
}

+ (id)idBase
{
  return CFSTR("DOC.sidebar");
}

+ (id)headerWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "idBase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(CFSTR("header"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  composedID(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)itemWithTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "idBase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  composedID(CFSTR("item"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  composedID(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
