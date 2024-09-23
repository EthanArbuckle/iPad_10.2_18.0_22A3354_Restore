@implementation BannerAgent

- (void)dealloc
{
  _TtC8SOSBuddy11BannerAgent *v2;

  v2 = self;
  sub_1001B30BC();
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy11BannerAgent_bannerTapped));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy11BannerAgent_bannerDismissedByUser));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy11BannerAgent_anyBannerPresentedChanged));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC8SOSBuddy11BannerAgent_preferredBannerSizeWillChange));
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8SOSBuddy11BannerAgent_preferredBannerSizeDidChange));
  swift_bridgeObjectRelease(*(_QWORD *)&self->bannerTapped[OBJC_IVAR____TtC8SOSBuddy11BannerAgent__requesterId]);

  sub_100025CF8((uint64_t)self + OBJC_IVAR____TtC8SOSBuddy11BannerAgent__contentProducer);
}

- (_TtC8SOSBuddy11BannerAgent)init
{
  _TtC8SOSBuddy11BannerAgent *result;

  result = (_TtC8SOSBuddy11BannerAgent *)_swift_stdlib_reportUnimplementedInitializer("SOSBuddy.BannerAgent", 20, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void)bannerSourceDidInvalidate:(id)a3
{
  _TtC8SOSBuddy11BannerAgent *v5;

  swift_unknownObjectRetain(a3);
  v5 = self;
  sub_1001B6FA4();
  swift_unknownObjectRelease(a3);

}

@end
