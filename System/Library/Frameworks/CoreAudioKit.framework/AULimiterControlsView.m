@implementation AULimiterControlsView

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AULimiterControlsView();
  -[AULimiterControlsView bounds](&v6, sel_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC12CoreAudioKit21AULimiterControlsView *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_21319D058(x, y, width, height);

}

- (_TtC12CoreAudioKit21AULimiterControlsView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit21AULimiterControlsView *)sub_21319D108(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit21AULimiterControlsView)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  objc_class *v6;
  _TtC12CoreAudioKit21AULimiterControlsView *result;

  v4 = OBJC_IVAR____TtC12CoreAudioKit21AULimiterControlsView_meter;
  v5 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v4) = (Class)sub_21319CC18();
  v6 = (objc_class *)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit21AULimiterControlsView_knobs) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit21AULimiterControlsView_previousWidth) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12CoreAudioKit21AULimiterControlsView_spacingConstraints) = v6;

  result = (_TtC12CoreAudioKit21AULimiterControlsView *)sub_2131E1DF4();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
