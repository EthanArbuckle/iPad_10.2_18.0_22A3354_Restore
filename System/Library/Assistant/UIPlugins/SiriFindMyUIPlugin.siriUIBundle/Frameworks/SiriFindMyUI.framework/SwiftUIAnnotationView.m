@implementation SwiftUIAnnotationView

- (_TtC12SiriFindMyUI21SwiftUIAnnotationView)initWithAnnotation:(id)a3 reuseIdentifier:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a4)
  {
    v4 = sub_21ED80E9C();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = swift_unknownObjectRetain();
  return (_TtC12SiriFindMyUI21SwiftUIAnnotationView *)sub_21ED626FC(v7, v4, v6);
}

- (_TtC12SiriFindMyUI21SwiftUIAnnotationView)initWithCoder:(id)a3
{
  sub_21ED628A8(a3);
  return 0;
}

- (void)prepareForReuse
{
  _TtC12SiriFindMyUI21SwiftUIAnnotationView *v2;

  v2 = self;
  sub_21ED62998();

}

+ (BOOL)_wantsViewBasedPositioning
{
  return 1;
}

- (UIEdgeInsets)safeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12SiriFindMyUI21SwiftUIAnnotationView_hostView));
}

@end
