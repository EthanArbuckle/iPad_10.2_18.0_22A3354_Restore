@implementation AppStoreVideoPlayerViewController

- (_TtC8AppStore33AppStoreVideoPlayerViewController)init
{
  _TtC8AppStore33AppStoreVideoPlayerViewController *v2;
  void *v3;
  _TtC8AppStore33AppStoreVideoPlayerViewController *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType(self, a2);
  v2 = -[AppStoreVideoPlayerViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", 0, 0);
  v3 = (void *)objc_opt_self(AVAppStoreBehavior);
  v4 = v2;
  v5 = objc_msgSend(v3, "behaviorWithFirstGenerationEmbeddedPlayer");
  -[AppStoreVideoPlayerViewController addBehavior:](v4, "addBehavior:", v5);

  return v4;
}

- (_TtC8AppStore33AppStoreVideoPlayerViewController)initWithCoder:(id)a3
{
  _TtC8AppStore33AppStoreVideoPlayerViewController *result;

  result = (_TtC8AppStore33AppStoreVideoPlayerViewController *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/AppStoreVideoPlayerViewController.swift", 48, 2, 23, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore33AppStoreVideoPlayerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC8AppStore33AppStoreVideoPlayerViewController *result;

  v4 = a4;
  result = (_TtC8AppStore33AppStoreVideoPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.AppStoreVideoPlayerViewController", 42, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (_TtC8AppStore33AppStoreVideoPlayerViewController)initWithPlayerLayerView:(id)a3
{
  id v3;
  _TtC8AppStore33AppStoreVideoPlayerViewController *result;

  v3 = a3;
  result = (_TtC8AppStore33AppStoreVideoPlayerViewController *)_swift_stdlib_reportUnimplementedInitializer("AppStore.AppStoreVideoPlayerViewController", 42, "init(playerLayerView:)", 22, 0);
  __break(1u);
  return result;
}

@end
