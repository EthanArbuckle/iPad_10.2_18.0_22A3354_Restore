@implementation AppEventView

- (_TtC22SubscribePageExtension12AppEventView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension12AppEventView *)sub_1005B1000();
}

- (_TtC22SubscribePageExtension12AppEventView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC22SubscribePageExtension12AppEventView *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_clickAction;
  v6 = sub_10000DF3C((uint64_t *)&unk_1008052D0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_initialLongPressLocation;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v8 = a3;

  result = (_TtC22SubscribePageExtension12AppEventView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/AppEventView.swift", 41, 2, 47, 0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC22SubscribePageExtension12AppEventView *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_longPressGestureRecognizer);
  v5 = self;
  objc_msgSend(v4, "removeTarget:action:", v5, 0);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[AppEventView dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_formattedDateView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_appEventCardView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_longPressGestureRecognizer));
  sub_100011088((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_clickAction, (uint64_t *)&unk_1008052E0);
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension12AppEventView *v2;

  v2 = self;
  sub_1005AF5A4();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _TtC22SubscribePageExtension12AppEventView *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = type metadata accessor for AppEventCardLayout(0);
  __chkstk_darwin(v6);
  v8 = (uint64_t *)((char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = qword_1007F10B0;
  v10 = self;
  if (v9 != -1)
    swift_once(&qword_1007F10B0, sub_1000B40CC);
  sub_100460948((uint64_t)xmmword_100851230, (uint64_t)v10, width, height);
  v12 = v11;
  v13 = *(Class *)((char *)&v10->super.super.super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_appEventCardView);
  sub_10015BF20((uint64_t)v8);
  sub_1005B08AC(v13, v8, width, height);
  v15 = v14;
  v17 = v16;
  sub_10001FA98((uint64_t)v8);

  v18 = v12 + v17;
  v19 = v15;
  result.height = v18;
  result.width = v19;
  return result;
}

- (void)stateChangedFor:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension12AppEventView *v5;

  v4 = a3;
  v5 = self;
  sub_1005AF924(v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC22SubscribePageExtension12AppEventView *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1005B0214((uint64_t)v6, v7);

  return v9 & 1;
}

- (_TtC22SubscribePageExtension29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC22SubscribePageExtension29AppPromotionFormattedDateView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_formattedDateView);
}

- (_TtC22SubscribePageExtension16AppEventCardView)accessibilityAppEventCardView
{
  return (_TtC22SubscribePageExtension16AppEventCardView *)*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC22SubscribePageExtension12AppEventView_appEventCardView);
}

@end
