@implementation AUDelayGraphView

- (void)accessibilityIncrement
{
  _TtC12CoreAudioKit16AUDelayGraphView *v2;

  v2 = self;
  sub_21317211C();

}

- (void)accessibilityDecrement
{
  _TtC12CoreAudioKit16AUDelayGraphView *v2;

  v2 = self;
  sub_2131722C0();

}

- (BOOL)accessibilityActivate
{
  _TtC12CoreAudioKit16AUDelayGraphView *v2;

  v2 = self;
  sub_213172464();

  return 1;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_2131752A0(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_2131749AC);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_2131752A0(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_213174D48);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_2131752A0(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t, void *))sub_213175338);
}

- (void)tintColorDidChange
{
  _TtC12CoreAudioKit16AUDelayGraphView *v2;

  v2 = self;
  sub_213175678();

}

- (_TtC12CoreAudioKit16AUDelayGraphView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit16AUDelayGraphView *)sub_213175958(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit16AUDelayGraphView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit16AUDelayGraphView *)sub_213175C2C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit16AUDelayGraphView_pointLayer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit16AUDelayGraphView_accessibilityTimeFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit16AUDelayGraphView_accessibilityDecimalFormatter));
  swift_bridgeObjectRelease();
  sub_213176314((uint64_t)self + OBJC_IVAR____TtC12CoreAudioKit16AUDelayGraphView_dataSource);
}

@end
