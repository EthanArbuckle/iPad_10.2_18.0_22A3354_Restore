@implementation B332SetupViewController

- (void)viewWillAppear:(BOOL)a3
{
  _TtC18SharingViewService23B332SetupViewController *v4;

  v4 = self;
  sub_1000A5BB8(a3);

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC18SharingViewService23B332SetupViewController *v4;

  v4 = self;
  sub_1000A5E5C(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  sub_1000A5FF0(self, (uint64_t)a2, a3, type metadata accessor for B332SetupViewController, (SEL *)&selRef_viewDidDisappear_);
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t (*v8)();
  uint64_t v9;
  _TtC18SharingViewService23B332SetupViewController *v10;

  v5 = _Block_copy(a4);
  if (v5)
  {
    v6 = v5;
    v7 = swift_allocObject(&unk_10017BCD0, 24, 7);
    *(_QWORD *)(v7 + 16) = v6;
    v8 = sub_10005B9E4;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v10 = self;
  sub_1000A675C((uint64_t)v10, v9);
  sub_100012F60((uint64_t)v8, v7);

}

- (void)dealloc
{
  _TtC18SharingViewService23B332SetupViewController *v2;
  uint64_t v3;

  v2 = self;
  sub_1000A60C8((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  uint64_t v3;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18SharingViewService23B332SetupViewController_presentedPairingVC));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC18SharingViewService23B332SetupViewController_proxy, v3);
}

- (_TtC18SharingViewService23B332SetupViewController)initWithMainController:(id)a3
{
  objc_super v6;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18SharingViewService23B332SetupViewController_presentedPairingVC) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18SharingViewService23B332SetupViewController_proxy, 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for B332SetupViewController();
  return -[SVSBaseViewController initWithMainController:](&v6, "initWithMainController:", a3);
}

- (_TtC18SharingViewService23B332SetupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSString v9;
  id v10;
  _TtC18SharingViewService23B332SetupViewController *v11;
  objc_super v13;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18SharingViewService23B332SetupViewController_presentedPairingVC) = 0;
    swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18SharingViewService23B332SetupViewController_proxy, 0);
    v8 = a4;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC18SharingViewService23B332SetupViewController_presentedPairingVC) = 0;
    swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18SharingViewService23B332SetupViewController_proxy, 0);
    v10 = a4;
    v9 = 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for B332SetupViewController();
  v11 = -[B332SetupViewController initWithNibName:bundle:](&v13, "initWithNibName:bundle:", v9, a4);

  return v11;
}

- (_TtC18SharingViewService23B332SetupViewController)initWithCoder:(id)a3
{
  objc_super v6;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18SharingViewService23B332SetupViewController_presentedPairingVC) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC18SharingViewService23B332SetupViewController_proxy, 0);
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for B332SetupViewController();
  return -[B332SetupViewController initWithCoder:](&v6, "initWithCoder:", a3);
}

@end
