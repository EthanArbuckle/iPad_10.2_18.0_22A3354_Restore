@implementation PlayButton

- (_TtC20ProductPageExtension10PlayButton)init
{
  return (_TtC20ProductPageExtension10PlayButton *)sub_1003F5D44();
}

- (_TtC20ProductPageExtension10PlayButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1003F6294();
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double width;

  if (result.height < result.width)
    result.width = result.height;
  if (result.width > 60.0)
    result.width = 60.0;
  if (result.width <= 31.0)
    result.width = 0.0;
  width = result.width;
  result.height = width;
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension10PlayButton *v2;

  v2 = self;
  sub_1003F6018();

}

- (void)didTap
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC20ProductPageExtension10PlayButton *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC20ProductPageExtension10PlayButton_tapActionBlock);
  if (v2)
  {
    v3 = *(_QWORD *)&self->backgroundView[OBJC_IVAR____TtC20ProductPageExtension10PlayButton_tapActionBlock];
    v5 = self;
    v4 = sub_100018918((uint64_t)v2, v3);
    v2(v4);
    sub_100018908((uint64_t)v2, v3);

  }
}

- (_TtC20ProductPageExtension10PlayButton)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension10PlayButton *result;

  result = (_TtC20ProductPageExtension10PlayButton *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.PlayButton", 31, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension10PlayButton_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension10PlayButton_glyphView));
  sub_100018908(*(uint64_t *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC20ProductPageExtension10PlayButton_tapActionBlock), *(_QWORD *)&self->backgroundView[OBJC_IVAR____TtC20ProductPageExtension10PlayButton_tapActionBlock]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension10PlayButton_tapGestureRecognizer));
}

@end
