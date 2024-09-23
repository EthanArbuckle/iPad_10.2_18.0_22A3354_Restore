@implementation AppPromotionDetailPageContentView

- (_TtC20ProductPageExtension33AppPromotionDetailPageContentView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1005AF8EC();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC20ProductPageExtension33AppPromotionDetailPageContentView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  v6 = sub_1005AB0C0(width, height);
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension33AppPromotionDetailPageContentView *v2;

  v2 = self;
  sub_1005ACCE0();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  v7 = v13.receiver;
  v8 = a4;
  v9 = -[AppPromotionDetailPageContentView hitTest:withEvent:](&v13, "hitTest:withEvent:", v8, x, y);
  if (v9)
  {
    v10 = v9;
    sub_100018B6C(0, (unint64_t *)&qword_1008119A0, NSObject_ptr);
    v11 = static NSObject.== infix(_:_:)(v10, v7);

    v7 = v10;
    if ((v11 & 1) == 0)
      return v10;
  }
  else
  {

  }
  v10 = 0;
  return v10;
}

- (_TtC20ProductPageExtension33AppPromotionDetailPageContentView)initWithFrame:(CGRect)a3
{
  _TtC20ProductPageExtension33AppPromotionDetailPageContentView *result;

  result = (_TtC20ProductPageExtension33AppPromotionDetailPageContentView *)_swift_stdlib_reportUnimplementedInitializer("ProductPageExtension.AppPromotionDetailPageContentView", 54, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_primaryContent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_secondaryContent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_availabilityLabelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_promotionKindLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_subtitleView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_detailLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_inlineLearnMoreLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_learnMoreButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_separatorView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_learnMoreButtonAction));
  v3 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension33AppPromotionDetailPageContentView_mediaOverlayStyle;
  v4 = type metadata accessor for MediaOverlayStyle(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
