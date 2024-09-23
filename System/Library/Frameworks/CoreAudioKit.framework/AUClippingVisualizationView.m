@implementation AUClippingVisualizationView

- (UIColor)tintColor
{
  return (UIColor *)sub_21319AEBC(self, (uint64_t)a2, type metadata accessor for AUClippingVisualizationView);
}

- (void)setTintColor:(id)a3
{
  sub_21319AF1C(self, (uint64_t)a2, a3, type metadata accessor for AUClippingVisualizationView, &OBJC_IVAR____TtC12CoreAudioKit27AUClippingVisualizationView_clipShape, (SEL *)&selRef_setFillColor_);
}

- (void)layoutSubviews
{
  _TtC12CoreAudioKit27AUClippingVisualizationView *v2;

  v2 = self;
  sub_21319BC78();

}

- (_TtC12CoreAudioKit27AUClippingVisualizationView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit27AUClippingVisualizationView *)sub_21319BF0C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit27AUClippingVisualizationView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit27AUClippingVisualizationView *)sub_21319C08C(a3);
}

- (void).cxx_destruct
{
  void *v3;
  id v4;

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUClippingVisualizationView_clipShape));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUClippingVisualizationView_sineWave));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12CoreAudioKit27AUClippingVisualizationView_midLine));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit27AUClippingVisualizationView_clipLines);
  objc_release(*(id *)((char *)&self->super.super.super._responderFlags
                     + OBJC_IVAR____TtC12CoreAudioKit27AUClippingVisualizationView_clipLines));

  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC12CoreAudioKit27AUClippingVisualizationView_clipAreas);
  objc_release(*(id *)((char *)&self->super.super.super._responderFlags
                     + OBJC_IVAR____TtC12CoreAudioKit27AUClippingVisualizationView_clipAreas));

}

@end
