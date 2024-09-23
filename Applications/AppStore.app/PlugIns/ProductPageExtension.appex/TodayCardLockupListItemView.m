@implementation TodayCardLockupListItemView

- (_TtC20ProductPageExtension27TodayCardLockupListItemView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension27TodayCardLockupListItemView *)sub_1005A2CB8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension27TodayCardLockupListItemView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  _OWORD *v7;
  id v8;
  _TtC20ProductPageExtension27TodayCardLockupListItemView *result;

  *((_BYTE *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC20ProductPageExtension27TodayCardLockupListItemView_displaysLabel) = 1;
  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension27TodayCardLockupListItemView_clickAction;
  v6 = sub_10000DAF8((uint64_t *)&unk_10081D490);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (_OWORD *)((char *)self + OBJC_IVAR____TtC20ProductPageExtension27TodayCardLockupListItemView_clickSender);
  *v7 = 0u;
  v7[1] = 0u;
  v8 = a3;

  result = (_TtC20ProductPageExtension27TodayCardLockupListItemView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/TodayCardLockupListOverlayView.swift", 57, 2, 68, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC20ProductPageExtension27TodayCardLockupListItemView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v3 = self;
  v4 = sub_1005A5CC0();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension27TodayCardLockupListItemView *v2;

  v2 = self;
  sub_1005A313C();

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  id v13;
  objc_super v14;
  CGPoint v15;
  CGRect v16;

  y = a3.y;
  x = a3.x;
  v14.receiver = self;
  v14.super_class = (Class)swift_getObjectType();
  v7 = v14.receiver;
  v8 = a4;
  v9 = -[TodayCardLockupListItemView hitTest:withEvent:](&v14, "hitTest:withEvent:", v8, x, y);
  if (v9
    && (objc_msgSend(v7, "bounds", v14.receiver, v14.super_class), v15.x = x, v15.y = y, CGRectContainsPoint(v16, v15))
    && (sub_1000951BC(), (static NSObject.== infix(_:_:)(v9, v7) & 1) == 0))
  {
    v11 = objc_opt_self(UIControl);
    v12 = swift_dynamicCastObjCClass(v9, v11);

    if (v12)
      v13 = v7;
    else
      v13 = v9;
    if (!v12)
      v9 = v7;
    v7 = v13;
  }
  else
  {

  }
  return v9;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v4;

  v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[TodayCardLockupListItemView setIsAccessibilityElement:](&v4, "setIsAccessibilityElement:", v3);
}

- (NSString)accessibilityLabel
{
  void *v2;
  _TtC20ProductPageExtension27TodayCardLockupListItemView *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC20ProductPageExtension27TodayCardLockupListItemView_label);
  v3 = self;
  v4 = objc_msgSend(v2, "accessibilityLabel");
  if (v4)
  {
    v5 = v4;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v4);
    v7 = v6;

    v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {

    v8 = 0;
  }
  return (NSString *)v8;
}

- (void)setAccessibilityLabel:(id)a3
{
  objc_class *ObjectType;
  uint64_t v6;
  uint64_t v7;
  _TtC20ProductPageExtension27TodayCardLockupListItemView *v8;
  _TtC20ProductPageExtension27TodayCardLockupListItemView *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v7 = v6;
    v8 = self;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v9 = self;
  }
  v10.receiver = self;
  v10.super_class = ObjectType;
  -[TodayCardLockupListItemView setAccessibilityLabel:](&v10, "setAccessibilityLabel:", a3);

}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (void)setAccessibilityTraits:(unint64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  -[TodayCardLockupListItemView setAccessibilityTraits:](&v4, "setAccessibilityTraits:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27TodayCardLockupListItemView_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension27TodayCardLockupListItemView_label));
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension27TodayCardLockupListItemView_clickAction, &qword_100819850);
  sub_100010F2C((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension27TodayCardLockupListItemView_clickSender, &qword_100808F20);
}

@end
