@implementation ASUIRouter

- (_TtC16AccessorySetupUI10ASUIRouter)init
{
  return (_TtC16AccessorySetupUI10ASUIRouter *)sub_10001EC2C((uint64_t)self, (uint64_t)a2);
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;

  sub_10000A0F8((uint64_t)self + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_currentView, v3);
  sub_10000A0F8((uint64_t)self + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_delegate, v4);

  swift_unknownObjectRelease(*(Class *)((char *)&self->super.isa
                                      + OBJC_IVAR____TtC16AccessorySetupUI10ASUIRouter_presenter));

}

- (void)proxCardFlowDidDismiss
{
  _TtC16AccessorySetupUI10ASUIRouter *v2;

  v2 = self;
  sub_10001ED98();

}

@end
