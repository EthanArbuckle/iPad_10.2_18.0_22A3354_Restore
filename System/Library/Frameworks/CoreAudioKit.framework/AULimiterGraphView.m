@implementation AULimiterGraphView

- (_TtC12CoreAudioKit18AULimiterGraphView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *v8;
  uint64_t v9;
  id v10;
  _TtC12CoreAudioKit18AULimiterGraphView *v11;
  _TtC12CoreAudioKit18AULimiterGraphView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (objc_class *)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit18AULimiterGraphView_levels) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit18AULimiterGraphView_lines) = v8;
  v9 = OBJC_IVAR____TtC12CoreAudioKit18AULimiterGraphView_peaks;
  v10 = objc_allocWithZone(MEMORY[0x24BDE5758]);
  v11 = self;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)objc_msgSend(v10, sel_init);

  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for AULimiterGraphView();
  v12 = -[AULimiterGraphView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  sub_2131D17B8();

  return v12;
}

- (_TtC12CoreAudioKit18AULimiterGraphView)initWithCoder:(id)a3
{
  objc_class *v5;
  uint64_t v6;
  id v7;
  id v8;
  _TtC12CoreAudioKit18AULimiterGraphView *result;

  v5 = (objc_class *)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit18AULimiterGraphView_levels) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit18AULimiterGraphView_lines) = v5;
  v6 = OBJC_IVAR____TtC12CoreAudioKit18AULimiterGraphView_peaks;
  v7 = objc_allocWithZone(MEMORY[0x24BDE5758]);
  v8 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);

  result = (_TtC12CoreAudioKit18AULimiterGraphView *)sub_2131E1DF4();
  __break(1u);
  return result;
}

- (void)layoutSublayersOfLayer:(id)a3
{
  void *v5;
  id v6;
  _TtC12CoreAudioKit18AULimiterGraphView *v7;

  v5 = (void *)objc_opt_self();
  v6 = a3;
  v7 = self;
  objc_msgSend(v5, sel_begin);
  objc_msgSend(v5, sel_setDisableActions_, 1);
  sub_2131D1E2C();
  objc_msgSend(v5, sel_commit);

}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  _TtC12CoreAudioKit18AULimiterGraphView *v5;
  id v6;
  id v7;
  id v8;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit18AULimiterGraphView_peaks);
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_tintColor);
  v7 = objc_msgSend(v6, sel_colorWithAlphaComponent_, 0.5);

  v8 = objc_msgSend(v7, sel_CGColor);
  objc_msgSend(v3, sel_setFillColor_, v8);

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
