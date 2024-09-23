@implementation DebugNavigationController

- (void)viewDidLoad
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[DebugNavigationController viewDidLoad](&v3, sel_viewDidLoad);
  objc_msgSend(v2, sel_setDelegate_, v2, v3.receiver, v3.super_class);

}

- (_TtC8NewsFeed25DebugNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  return -[DebugNavigationController initWithNavigationBarClass:toolbarClass:](&v7, sel_initWithNavigationBarClass_toolbarClass_, a3, a4);
}

- (_TtC8NewsFeed25DebugNavigationController)initWithRootViewController:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[DebugNavigationController initWithRootViewController:](&v5, sel_initWithRootViewController_, a3);
}

- (_TtC8NewsFeed25DebugNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  objc_class *ObjectType;
  id v8;
  id v9;
  _TtC8NewsFeed25DebugNavigationController *v10;
  objc_super v12;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_1BB8729A0();
    v8 = a4;
    a3 = (id)sub_1BB872970();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[DebugNavigationController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);

  return v10;
}

- (_TtC8NewsFeed25DebugNavigationController)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return -[DebugNavigationController initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtC8NewsFeed25DebugNavigationController *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1BA90F93C(v7);

}

@end
