@implementation AppPromotionView

- (_TtC8AppStore16AppPromotionView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore16AppPromotionView *)sub_10030FF10();
}

- (_TtC8AppStore16AppPromotionView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC8AppStore16AppPromotionView *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore16AppPromotionView_clickAction;
  v6 = sub_10007B804((uint64_t *)&unk_100833700);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC8AppStore16AppPromotionView_initialLongPressLocation;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v8 = a3;

  result = (_TtC8AppStore16AppPromotionView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/AppPromotionView.swift", 31, 2, 46, 0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC8AppStore16AppPromotionView *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore16AppPromotionView_longPressGestureRecognizer);
  v5 = self;
  objc_msgSend(v4, "removeTarget:action:", v5, 0);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[AppPromotionView dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore16AppPromotionView_availabilityLabelView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore16AppPromotionView_appPromotionCardView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore16AppPromotionView_longPressGestureRecognizer));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore16AppPromotionView_clickAction, (uint64_t *)&unk_100835F20);
}

- (void)layoutSubviews
{
  _TtC8AppStore16AppPromotionView *v2;

  v2 = self;
  sub_10030EBC4();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v5;
  _TtC8AppStore16AppPromotionView *v6;
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
  v5 = qword_100827530;
  v6 = self;
  if (v5 != -1)
    swift_once(&qword_100827530, sub_10028D190);
  sub_1006323CC((uint64_t)xmmword_10088B7D8, (uint64_t)v6, width, height);
  v8 = v7;
  v9 = sub_1005641A0(width, height);
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
  _TtC8AppStore16AppPromotionView *v5;

  v4 = a3;
  v5 = self;
  sub_10030EEE8(v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC8AppStore16AppPromotionView *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_10030F7D0((uint64_t)v6, v7);

  return v9 & 1;
}

- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC8AppStore29AppPromotionFormattedDateView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC8AppStore16AppPromotionView_availabilityLabelView));
}

- (_TtC8AppStore20AppPromotionCardView)accessibilityAppPromotionCardView
{
  return (_TtC8AppStore20AppPromotionCardView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                        + OBJC_IVAR____TtC8AppStore16AppPromotionView_appPromotionCardView));
}

@end
