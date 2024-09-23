@implementation GPVFXView

- (_TtC15ImagePlayground9GPVFXView)initWithCoder:(id)a3
{
  return (_TtC15ImagePlayground9GPVFXView *)sub_23ECE3CB8(a3);
}

- (_TtC15ImagePlayground9GPVFXView)initWithFrame:(CGRect)a3 options:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (a4)
    v8 = sub_23EFD140C();
  else
    v8 = 0;
  return (_TtC15ImagePlayground9GPVFXView *)sub_23ECE3DE0(v8, x, y, width, height);
}

- (_TtC15ImagePlayground9GPVFXView)initWithFrame:(CGRect)a3
{
  _TtC15ImagePlayground9GPVFXView *result;

  result = (_TtC15ImagePlayground9GPVFXView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

@end
