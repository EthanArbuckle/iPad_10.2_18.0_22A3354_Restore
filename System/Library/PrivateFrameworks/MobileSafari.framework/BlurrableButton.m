@implementation BlurrableButton

- (_TtC12MobileSafari15BlurrableButton)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafari15BlurrableButton *)sub_18BAB59F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12MobileSafari15BlurrableButton)initWithCoder:(id)a3
{
  return (_TtC12MobileSafari15BlurrableButton *)sub_18BAB5B6C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari15BlurrableButton____lazy_storage___blurRadius));
}

@end
