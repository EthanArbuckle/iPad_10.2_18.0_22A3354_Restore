@implementation MFChevronView

- (_TtC16MagnifierSupport13MFChevronView)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport13MFChevronView *)sub_22749F828(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MagnifierSupport13MFChevronView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22749FDA8();
}

- (void)layoutSubviews
{
  char *v2;
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[MFChevronView layoutSubviews](&v4, sel_layoutSubviews);
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC16MagnifierSupport13MFChevronView_chevronLayer], sel_setPosition_, v3 * 0.5, -*(double *)&v2[OBJC_IVAR____TtC16MagnifierSupport13MFChevronView_chevronDistanceFromTopEdge]);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport13MFChevronView_chevronLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport13MFChevronView_chevronShapeAnimatableProperty));
}

@end
