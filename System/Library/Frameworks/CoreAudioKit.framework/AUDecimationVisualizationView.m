@implementation AUDecimationVisualizationView

- (UIColor)tintColor
{
  return (UIColor *)sub_21319AEBC(self, (uint64_t)a2, type metadata accessor for AUDecimationVisualizationView);
}

- (void)setTintColor:(id)a3
{
  sub_21319AF1C(self, (uint64_t)a2, a3, type metadata accessor for AUDecimationVisualizationView, &OBJC_IVAR____TtC12CoreAudioKit29AUDecimationVisualizationView_decimationShape, (SEL *)&selRef_setFillColor_);
}

- (void)layoutSubviews
{
  _TtC12CoreAudioKit29AUDecimationVisualizationView *v2;

  v2 = self;
  sub_213199F1C();

}

- (_TtC12CoreAudioKit29AUDecimationVisualizationView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit29AUDecimationVisualizationView *)sub_21319A290(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit29AUDecimationVisualizationView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit29AUDecimationVisualizationView *)sub_21319A3B4(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit29AUDecimationVisualizationView_decimationShape));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit29AUDecimationVisualizationView_sineShape));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit29AUDecimationVisualizationView_midLine));
}

@end
