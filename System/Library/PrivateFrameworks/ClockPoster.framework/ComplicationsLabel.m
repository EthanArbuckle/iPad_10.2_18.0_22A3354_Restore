@implementation ComplicationsLabel

- (_TtC11ClockPoster18ComplicationsLabel)initWithCoder:(id)a3
{
  id v4;
  _TtC11ClockPoster18ComplicationsLabel *result;

  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster18ComplicationsLabel_contentsSpacing) = (Class)0x4020000000000000;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster18ComplicationsLabel_orderedContents) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC11ClockPoster18ComplicationsLabel_complicationViews) = (Class)MEMORY[0x24BEE4AF8];
  v4 = a3;

  result = (_TtC11ClockPoster18ComplicationsLabel *)sub_237EE309C();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC11ClockPoster18ComplicationsLabel *v2;

  v2 = self;
  sub_237E48898();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC11ClockPoster18ComplicationsLabel *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_237E48A84(0, width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (_TtC11ClockPoster18ComplicationsLabel)initWithFrame:(CGRect)a3
{
  _TtC11ClockPoster18ComplicationsLabel *result;

  result = (_TtC11ClockPoster18ComplicationsLabel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
