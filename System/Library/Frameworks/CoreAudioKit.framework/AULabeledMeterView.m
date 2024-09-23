@implementation AULabeledMeterView

- (_TtC12CoreAudioKit18AULabeledMeterView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit18AULabeledMeterView *)sub_2131A2C6C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit18AULabeledMeterView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_2131A54F8();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BEBDF50];
}

- (void)willMoveToSuperview:(id)a3
{
  id v5;
  _TtC12CoreAudioKit18AULabeledMeterView *v6;

  v5 = a3;
  v6 = self;
  sub_2131A3144((uint64_t)a3);

}

- (void)tintColorDidChange
{
  void *v3;
  void *v4;
  _TtC12CoreAudioKit18AULabeledMeterView *v5;
  id v6;
  id v7;
  id v8;

  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12CoreAudioKit18AULabeledMeterView_fillLayer);
  v4 = (void *)objc_opt_self();
  v5 = self;
  v6 = objc_msgSend(v4, sel_tintColor);
  v7 = objc_msgSend(v6, sel_colorWithAlphaComponent_, 0.5);

  v8 = objc_msgSend(v7, sel_CGColor);
  objc_msgSend(v3, sel_setBackgroundColor_, v8);

}

- (void)layoutSublayersOfLayer:(id)a3
{
  id v4;
  _TtC12CoreAudioKit18AULabeledMeterView *v5;

  v4 = a3;
  v5 = self;
  sub_2131A5260(v4);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit18AULabeledMeterView_peakTimer));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit18AULabeledMeterView_meterLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit18AULabeledMeterView_fillLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit18AULabeledMeterView_peakLayer));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit18AULabeledMeterView_meterLabelLayer));
}

@end
