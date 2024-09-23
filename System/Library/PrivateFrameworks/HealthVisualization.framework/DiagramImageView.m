@implementation DiagramImageView

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  v3 = *MEMORY[0x1E0DC55F0];
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_1BC9C8530(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  sub_1BC9C8580(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_setFrame_, (SEL *)&selRef_frame);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_1BC9C8530(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  sub_1BC9C8580(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (const char **)&selRef_setBounds_, (SEL *)&selRef_bounds);
}

- (_TtC19HealthVisualization16DiagramImageView)initWithFrame:(CGRect)a3
{
  return (_TtC19HealthVisualization16DiagramImageView *)DiagramImageView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC19HealthVisualization16DiagramImageView)initWithCoder:(id)a3
{
  return (_TtC19HealthVisualization16DiagramImageView *)DiagramImageView.init(coder:)(a3);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC19HealthVisualization16DiagramImageView *v6;

  v5 = a3;
  v6 = self;
  sub_1BC9C8B60(a3);

}

- (_TtC19HealthVisualization16DiagramImageView)initWithImage:(id)a3
{
  id v3;
  _TtC19HealthVisualization16DiagramImageView *result;

  v3 = a3;
  result = (_TtC19HealthVisualization16DiagramImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19HealthVisualization16DiagramImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5;
  id v6;
  _TtC19HealthVisualization16DiagramImageView *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC19HealthVisualization16DiagramImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC19HealthVisualization16DiagramImageView_imageRenderer));
  sub_1BC9CA6EC((uint64_t)self + OBJC_IVAR____TtC19HealthVisualization16DiagramImageView_delegate);
  sub_1BC9C82F8(*(id *)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC19HealthVisualization16DiagramImageView_lastUsedTransformer));
}

@end
