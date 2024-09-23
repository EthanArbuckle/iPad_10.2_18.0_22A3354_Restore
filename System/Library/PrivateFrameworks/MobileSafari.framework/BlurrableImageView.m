@implementation BlurrableImageView

- (_TtC12MobileSafari18BlurrableImageView)init
{
  return -[BlurrableImageView initWithImage:](self, sel_initWithImage_, 0);
}

- (_TtC12MobileSafari18BlurrableImageView)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafari18BlurrableImageView *)sub_18BA001E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12MobileSafari18BlurrableImageView)initWithImage:(id)a3
{
  id v4;

  v4 = a3;
  return (_TtC12MobileSafari18BlurrableImageView *)sub_18BA00364(a3);
}

- (_TtC12MobileSafari18BlurrableImageView)initWithCoder:(id)a3
{
  return (_TtC12MobileSafari18BlurrableImageView *)sub_18BA004D0(a3);
}

- (_TtC12MobileSafari18BlurrableImageView)initWithImage:(id)a3 highlightedImage:(id)a4
{
  id v5;
  id v6;
  _TtC12MobileSafari18BlurrableImageView *result;

  v5 = a3;
  v6 = a4;
  result = (_TtC12MobileSafari18BlurrableImageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari18BlurrableImageView____lazy_storage___blurRadius));
}

@end
