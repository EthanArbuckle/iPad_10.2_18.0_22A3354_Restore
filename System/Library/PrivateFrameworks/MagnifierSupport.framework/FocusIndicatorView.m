@implementation FocusIndicatorView

- (_TtC16MagnifierSupport18FocusIndicatorView)init
{
  return (_TtC16MagnifierSupport18FocusIndicatorView *)sub_227547D44();
}

- (_TtC16MagnifierSupport18FocusIndicatorView)initWithCoder:(id)a3
{
  id v4;
  _TtC16MagnifierSupport18FocusIndicatorView *result;

  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MagnifierSupport18FocusIndicatorView____lazy_storage___reticle) = 0;
  v4 = a3;

  result = (_TtC16MagnifierSupport18FocusIndicatorView *)sub_22758ECC4();
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  _TtC16MagnifierSupport18FocusIndicatorView *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = self;
  v3 = sub_227547CA0();
  objc_msgSend(v3, sel_intrinsicContentSize);
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[FocusIndicatorView intrinsicContentSize](self, sel_intrinsicContentSize, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (_TtC16MagnifierSupport18FocusIndicatorView)initWithFrame:(CGRect)a3
{
  _TtC16MagnifierSupport18FocusIndicatorView *result;

  result = (_TtC16MagnifierSupport18FocusIndicatorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18FocusIndicatorView____lazy_storage___reticle));
}

@end
