@implementation AppEventView

- (_TtC8AppStore12AppEventView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore12AppEventView *)sub_1001B2AF4();
}

- (_TtC8AppStore12AppEventView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  _TtC8AppStore12AppEventView *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore12AppEventView_clickAction;
  v6 = sub_10007B804((uint64_t *)&unk_100833700);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (char *)self + OBJC_IVAR____TtC8AppStore12AppEventView_initialLongPressLocation;
  *(_QWORD *)v7 = 0;
  *((_QWORD *)v7 + 1) = 0;
  v7[16] = 1;
  v8 = a3;

  result = (_TtC8AppStore12AppEventView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/AppEventView.swift", 27, 2, 47, 0);
  __break(1u);
  return result;
}

- (void)dealloc
{
  objc_class *ObjectType;
  void *v4;
  _TtC8AppStore12AppEventView *v5;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8AppStore12AppEventView_longPressGestureRecognizer);
  v5 = self;
  objc_msgSend(v4, "removeTarget:action:", v5, 0);
  v6.receiver = v5;
  v6.super_class = ObjectType;
  -[AppEventView dealloc](&v6, "dealloc");
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore12AppEventView_longPressGestureRecognizer));
  sub_1000057AC((uint64_t)self + OBJC_IVAR____TtC8AppStore12AppEventView_clickAction, (uint64_t *)&unk_100835F20);
}

- (void)layoutSubviews
{
  _TtC8AppStore12AppEventView *v2;

  v2 = self;
  sub_1001B15D8();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  _TtC8AppStore12AppEventView *v10;
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
  v9 = qword_100827530;
  v10 = self;
  if (v9 != -1)
    swift_once(&qword_100827530, sub_10028D190);
  sub_1006323CC((uint64_t)xmmword_10088B7D8, (uint64_t)v10, width, height);
  v12 = v11;
  v13 = *(Class *)((char *)&v10->super.super.super.isa + OBJC_IVAR____TtC8AppStore12AppEventView_appEventCardView);
  sub_10053B950((uint64_t)v8);
  sub_100631D18(v13, v8, width, height);
  v15 = v14;
  v17 = v16;
  sub_1001B2A84((uint64_t)v8);

  v18 = v12 + v17;
  v19 = v15;
  result.height = v18;
  result.width = v19;
  return result;
}

- (void)stateChangedFor:(id)a3
{
  id v4;
  _TtC8AppStore12AppEventView *v5;

  v4 = a3;
  v5 = self;
  sub_1001B1958(v4);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6;
  id v7;
  _TtC8AppStore12AppEventView *v8;
  char v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1001B2300((uint64_t)v6, v7);

  return v9 & 1;
}

- (_TtC8AppStore29AppPromotionFormattedDateView)accessibilityFormattedDateView
{
  return (_TtC8AppStore29AppPromotionFormattedDateView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                                 + OBJC_IVAR____TtC8AppStore12AppEventView_formattedDateView));
}

- (_TtC8AppStore16AppEventCardView)accessibilityAppEventCardView
{
  return (_TtC8AppStore16AppEventCardView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                                    + OBJC_IVAR____TtC8AppStore12AppEventView_appEventCardView));
}

@end
