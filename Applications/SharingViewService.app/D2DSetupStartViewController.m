@implementation D2DSetupStartViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService27D2DSetupStartViewController *v2;

  v2 = self;
  sub_10005DB24();

}

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService27D2DSetupStartViewController *v4;

  v4 = self;
  sub_10005E354(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  void *v5;
  id v6;
  NSString v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for D2DSetupStartViewController();
  v4 = v8.receiver;
  -[D2DSetupBaseViewController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
  v5 = (void *)objc_opt_self(NSDistributedNotificationCenter);
  v6 = objc_msgSend(v5, "defaultCenter", v8.receiver, v8.super_class);
  v7 = String._bridgeToObjectiveC()();
  objc_msgSend(v6, "removeObserver:name:object:", v4, v7, 0);

}

- (void)didReceiveDeviceSetupNotification:(id)a3
{
  uint64_t Strong;
  uint64_t v6;
  id v7;
  _TtC18SharingViewService27D2DSetupStartViewController *v8;
  uint64_t v9;

  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC18SharingViewService26D2DSetupBaseViewController_presenter);
  if (Strong)
  {
    v6 = Strong;
    v7 = a3;
    v8 = self;
    sub_10009EEFC(v7, v9);

    swift_unknownObjectRelease(v6);
  }
}

- (_TtC18SharingViewService27D2DSetupStartViewController)initWithContentView:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for D2DSetupStartViewController();
  return -[D2DSetupBaseViewController initWithContentView:](&v5, "initWithContentView:", a3);
}

@end
