@implementation BannerBaseViewController

- (NSString)requesterIdentifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->delegate[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_requesterIdentifier];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (NSString)requestIdentifier
{
  void *v2;
  _TtC13MediaRemoteUI24BannerBaseViewController *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration);
  v3 = self;
  v4 = objc_msgSend(v2, "requestIdentifier");
  static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
  v6 = v5;

  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

- (_TtC13MediaRemoteUI24BannerBaseViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100025FE8();
}

- (void)dealloc
{
  _TtC13MediaRemoteUI24BannerBaseViewController *v2;
  uint64_t v3;

  v2 = self;
  sub_100024510((uint64_t)v2, v3);
}

- (void).cxx_destruct
{
  sub_1000082F0((uint64_t)self + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_delegate);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_configuration));
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_requesterIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC13MediaRemoteUI24BannerBaseViewController_idleTimer));
}

- (void)viewDidLoad
{
  _TtC13MediaRemoteUI24BannerBaseViewController *v2;

  v2 = self;
  sub_100024668();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC13MediaRemoteUI24BannerBaseViewController *v4;

  v4 = self;
  sub_1000247B0(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _TtC13MediaRemoteUI24BannerBaseViewController *v4;

  v4 = self;
  sub_100024FA4(a3);

}

- (void)bannerTapActionWithSender:(id)a3
{
  sub_1000253E8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1000241E0);
}

- (void)bannerLongPressActionWithSender:(id)a3
{
  sub_1000253E8(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1000242C8);
}

- (void)presentableWillAppearAsBanner:(id)a3
{
  _TtC13MediaRemoteUI24BannerBaseViewController *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1000255A4();
  swift_unknownObjectRelease(a3);

}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  sub_1000254B8(self, (uint64_t)a2, (uint64_t)a3, a4, sub_1000257E8);
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  sub_1000254B8(self, (uint64_t)a2, (uint64_t)a3, a4, sub_100025AE0);
}

- (_TtC13MediaRemoteUI24BannerBaseViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  _TtC13MediaRemoteUI24BannerBaseViewController *result;

  v4 = a4;
  result = (_TtC13MediaRemoteUI24BannerBaseViewController *)_swift_stdlib_reportUnimplementedInitializer("MediaRemoteUI.BannerBaseViewController", 38, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

@end
