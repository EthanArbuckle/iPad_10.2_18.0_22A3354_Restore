@implementation AUDelayVisualizationView

- (UIColor)tintColor
{
  return (UIColor *)sub_21319AEBC(self, (uint64_t)a2, type metadata accessor for AUDelayVisualizationView);
}

- (void)setTintColor:(id)a3
{
  id v5;
  _TtC12CoreAudioKit24AUDelayVisualizationView *v6;

  v5 = a3;
  v6 = self;
  sub_213198D6C(a3);

}

- (_TtC12CoreAudioKit24AUDelayVisualizationView)initWithFrame:(CGRect)a3
{
  return (_TtC12CoreAudioKit24AUDelayVisualizationView *)sub_213198ED4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12CoreAudioKit24AUDelayVisualizationView)initWithCoder:(id)a3
{
  return (_TtC12CoreAudioKit24AUDelayVisualizationView *)sub_213199018(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
