@implementation CheckmarkView

- (_TtC11Diagnostics13CheckmarkView)initWithFrame:(CGRect)a3
{
  return (_TtC11Diagnostics13CheckmarkView *)sub_10009FDD0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11Diagnostics13CheckmarkView)initWithCoder:(id)a3
{
  return (_TtC11Diagnostics13CheckmarkView *)sub_10009FF20(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics13CheckmarkView_checkAnimationView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11Diagnostics13CheckmarkView_circleView));
}

@end
