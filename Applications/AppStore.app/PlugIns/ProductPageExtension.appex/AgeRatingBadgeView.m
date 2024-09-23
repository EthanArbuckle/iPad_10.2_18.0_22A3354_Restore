@implementation AgeRatingBadgeView

- (_TtC20ProductPageExtension18AgeRatingBadgeView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension18AgeRatingBadgeView *)sub_1002CCF48(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension18AgeRatingBadgeView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1002CDCC0();
}

- (void)tintColorDidChange
{
  void *v2;
  id v3;
  _TtC20ProductPageExtension18AgeRatingBadgeView *v4;

  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension18AgeRatingBadgeView_ageLabel);
  v4 = self;
  v3 = -[AgeRatingBadgeView tintColor](v4, "tintColor");
  objc_msgSend(v2, "setTextColor:", v3);

  -[AgeRatingBadgeView setNeedsDisplay](v4, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v7;
  _TtC20ProductPageExtension18AgeRatingBadgeView *v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = self;
  sub_1002CD59C(x, y, width, height, (uint64_t)v8, v7);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC20ProductPageExtension18AgeRatingBadgeView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1002CD81C(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  objc_class *ObjectType;
  _TtC20ProductPageExtension18AgeRatingBadgeView *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  objc_super v13;
  CGRect v14;
  CGRect v15;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v13.receiver = self;
  v13.super_class = ObjectType;
  v4 = self;
  -[AgeRatingBadgeView layoutSubviews](&v13, "layoutSubviews");
  v5 = *(Class *)((char *)&v4->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension18AgeRatingBadgeView_ageLabel);
  LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  objc_msgSend(v5, "sizeThatFits:", v6, v7, v13.receiver, v13.super_class);
  v9 = v8;
  v11 = v10;
  v14.origin.x = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  v12 = CGRectGetMidX(v14) - v9 * 0.5;
  v15.origin.x = LayoutMarginsAware<>.layoutFrame.getter(ObjectType);
  objc_msgSend(v5, "setFrame:", v12, CGRectGetMidY(v15) - v11 * 0.5, v9, v11);

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension18AgeRatingBadgeView_scalableCornerRadius;
  v4 = type metadata accessor for StaticDimension(0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC20ProductPageExtension18AgeRatingBadgeView_scalableHeight, v4);
  v5((char *)self + OBJC_IVAR____TtC20ProductPageExtension18AgeRatingBadgeView_scalableHorizontalPadding, v4);
  v5((char *)self + OBJC_IVAR____TtC20ProductPageExtension18AgeRatingBadgeView_scalableBorderWidth, v4);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension18AgeRatingBadgeView_ageLabel));
}

@end
