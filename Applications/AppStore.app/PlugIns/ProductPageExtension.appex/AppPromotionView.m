@implementation AppPromotionView

- (_TtC20ProductPageExtension16AppPromotionView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension16AppPromotionView *)sub_10019CA7C();
}

- (_TtC20ProductPageExtension16AppPromotionView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC20ProductPageExtension16AppPromotionView *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension16AppPromotionView_clickAction;
  v6 = sub_10000DAF8((uint64_t *)&unk_10081D490);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension16AppPromotionView_initialLongPressLocation;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v8 = a3;

  result = (_TtC20ProductPageExtension16AppPromotionView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/AppPromotionView.swift", 43, 2, 46, 0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC20ProductPageExtension16AppPromotionView *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension16AppPromotionView_longPressGestureRecognizer);
  v5 = self;
  objc_msgSend(v4, "removeTarget:action:", v5, 0);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[AppPromotionView dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppPromotionView_availabilityLabelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppPromotionView_appPromotionCardView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension16AppPromotionView_longPressGestureRecognizer));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension16AppPromotionView_clickAction, &qword_100819850);
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension16AppPromotionView *v2;

  v2 = self;
  sub_10019B6C8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v5;
  _TtC20ProductPageExtension16AppPromotionView *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = qword_100805B48;
  v6 = self;
  if (v5 != -1)
    swift_once(&qword_100805B48, sub_1003EDD48);
  sub_1001EDE64(xmmword_1008680E8, v6, width, height);
  v8 = v7;
  v9 = sub_1000A29F8(width, height);
  v11 = v10;

  v12 = v8 + v11;
  v13 = v9;
  result.height = v12;
  result.width = v13;
  return result;
}

- (void)stateChangedFor:(id)a3
{
  id v4;
  _TtC20ProductPageExtension16AppPromotionView *v5;

  v4 = a3;
  v5 = self;
  sub_10019B9EC(v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC20ProductPageExtension16AppPromotionView *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10019C2D4((uint64_t)v6, v7);

  return v9 & 1;
}

- (_TtC20ProductPageExtension29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC20ProductPageExtension29AppPromotionFormattedDateView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension16AppPromotionView_availabilityLabelView);
}

- (_TtC20ProductPageExtension20AppPromotionCardView)accessibilityAppPromotionCardView
{
  return (_TtC20ProductPageExtension20AppPromotionCardView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC20ProductPageExtension16AppPromotionView_appPromotionCardView);
}

@end
