@implementation PlayButton

- (void)layoutSubviews
{
  _TtC8AppStore10PlayButton *v2;

  v2 = self;
  sub_1000206B4();

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

- (_TtC8AppStore10PlayButton)init
{
  return (_TtC8AppStore10PlayButton *)sub_10001FF84();
}

- (_TtC8AppStore10PlayButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10050D08C();
}

- (void)didTap
{
  void (*v2)(uint64_t);
  uint64_t v3;
  uint64_t v4;
  _TtC8AppStore10PlayButton *v5;

  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.super.isa
                                      + OBJC_IVAR____TtC8AppStore10PlayButton_tapActionBlock);
  if (v2)
  {
    v3 = *(_QWORD *)&self->backgroundView[OBJC_IVAR____TtC8AppStore10PlayButton_tapActionBlock];
    v5 = self;
    v4 = sub_10003A340((uint64_t)v2, v3);
    v2(v4);
    sub_10003A350((uint64_t)v2, v3);

  }
}

- (_TtC8AppStore10PlayButton)initWithFrame:(CGRect)a3
{
  _TtC8AppStore10PlayButton *result;

  result = (_TtC8AppStore10PlayButton *)_swift_stdlib_reportUnimplementedInitializer("AppStore.PlayButton", 19, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  sub_10003A350(*(uint64_t *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8AppStore10PlayButton_tapActionBlock), *(_QWORD *)&self->backgroundView[OBJC_IVAR____TtC8AppStore10PlayButton_tapActionBlock]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore10PlayButton_tapGestureRecognizer));
}

@end
