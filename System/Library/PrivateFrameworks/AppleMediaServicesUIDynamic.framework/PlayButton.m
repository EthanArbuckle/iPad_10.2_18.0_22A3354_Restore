@implementation PlayButton

- (_TtC27AppleMediaServicesUIDynamic10PlayButton)init
{
  return (_TtC27AppleMediaServicesUIDynamic10PlayButton *)sub_1B9DBC0B8();
}

- (_TtC27AppleMediaServicesUIDynamic10PlayButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9DBC408();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = sub_1B9DBC504(a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  _TtC27AppleMediaServicesUIDynamic10PlayButton *v2;

  v2 = self;
  sub_1B9DBC530();

}

- (void)didTap
{
  _TtC27AppleMediaServicesUIDynamic10PlayButton *v2;

  v2 = self;
  sub_1B9DBC644();

}

- (_TtC27AppleMediaServicesUIDynamic10PlayButton)initWithFrame:(CGRect)a3
{
  sub_1B9DBC6C8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_glyphView));
  sub_1B9D63180(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_tapActionBlock));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC27AppleMediaServicesUIDynamic10PlayButton_tapGestureRecognizer));
}

@end
