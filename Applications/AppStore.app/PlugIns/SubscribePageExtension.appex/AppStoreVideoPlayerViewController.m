@implementation AppStoreVideoPlayerViewController

- (_TtC22SubscribePageExtension33AppStoreVideoPlayerViewController)init
{
  _TtC22SubscribePageExtension33AppStoreVideoPlayerViewController *v2;
  void *v3;
  _TtC22SubscribePageExtension33AppStoreVideoPlayerViewController *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v2 = -[AppStoreVideoPlayerViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0, 0);
  v3 = (void *)objc_opt_self(AVAppStoreBehavior);
  v4 = v2;
  v5 = objc_msgSend(v3, "behaviorWithFirstGenerationEmbeddedPlayer");
  -[AppStoreVideoPlayerViewController addBehavior:](v4, "addBehavior:", v5);

  return v4;
}

- (_TtC22SubscribePageExtension33AppStoreVideoPlayerViewController)initWithCoder:(id)a3
{
  _TtC22SubscribePageExtension33AppStoreVideoPlayerViewController *result;

  result = (_TtC22SubscribePageExtension33AppStoreVideoPlayerViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/AppStoreVideoPlayerViewController.swift", 62, 2, 23, 0);
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension33AppStoreVideoPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC22SubscribePageExtension33AppStoreVideoPlayerViewController *result;

  v4 = a4;
  result = (_TtC22SubscribePageExtension33AppStoreVideoPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.AppStoreVideoPlayerViewController", 56, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (_TtC22SubscribePageExtension33AppStoreVideoPlayerViewController)initWithPlayerLayerView:(id)a3
{
  id v3;
  _TtC22SubscribePageExtension33AppStoreVideoPlayerViewController *result;

  v3 = a3;
  result = (_TtC22SubscribePageExtension33AppStoreVideoPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.AppStoreVideoPlayerViewController", 56, "init(playerLayerView:)", 22, 0);
  __break(1u);
  return result;
}

@end
