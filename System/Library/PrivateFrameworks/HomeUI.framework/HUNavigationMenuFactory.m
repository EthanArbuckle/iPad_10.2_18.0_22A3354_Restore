@implementation HUNavigationMenuFactory

+ (id)homeMenuForButton:(id)a3
{
  char *v4;
  void *v5;

  swift_getObjCClassMetadata();
  v4 = (char *)a3;
  v5 = (void *)sub_1B8EFB578(v4);

  return v5;
}

- (HUNavigationMenuFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for NavigationMenuFactory();
  return -[HUNavigationMenuFactory init](&v3, sel_init);
}

@end
