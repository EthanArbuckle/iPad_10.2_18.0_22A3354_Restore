@implementation BlurrableView

- (_TtC12MobileSafari13BlurrableView)initWithFrame:(CGRect)a3
{
  return (_TtC12MobileSafari13BlurrableView *)sub_18B9B0C94(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12MobileSafari13BlurrableView)initWithCoder:(id)a3
{
  return (_TtC12MobileSafari13BlurrableView *)sub_18B9B0E20(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12MobileSafari13BlurrableView____lazy_storage___blurRadius));
}

@end
