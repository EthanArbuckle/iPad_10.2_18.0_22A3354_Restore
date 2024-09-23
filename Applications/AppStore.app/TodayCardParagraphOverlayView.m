@implementation TodayCardParagraphOverlayView

- (_TtC8AppStore29TodayCardParagraphOverlayView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore29TodayCardParagraphOverlayView *)sub_1001482D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore29TodayCardParagraphOverlayView)initWithCoder:(id)a3
{
  id v4;
  _TtC8AppStore29TodayCardParagraphOverlayView *result;

  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore29TodayCardParagraphOverlayView_isExpanded) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore29TodayCardParagraphOverlayView_sizeCategory) = 7;
  v4 = a3;

  result = (_TtC8AppStore29TodayCardParagraphOverlayView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/TodayCardParagraphOverlayView.swift", 44, 2, 52, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  _TtC8AppStore29TodayCardParagraphOverlayView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_100148678(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore29TodayCardParagraphOverlayView *v2;

  v2 = self;
  sub_1001488B8();

}

- (NSString)accessibilityLabel
{
  void *v2;
  _TtC8AppStore29TodayCardParagraphOverlayView *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore29TodayCardParagraphOverlayView_label);
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
  _TtC8AppStore29TodayCardParagraphOverlayView *v8;
  _TtC8AppStore29TodayCardParagraphOverlayView *v9;
  objc_super v10;

  ObjectType = (objc_class *)swift_getObjectType(self, a2);
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
  -[TodayCardParagraphOverlayView setAccessibilityLabel:](&v10, "setAccessibilityLabel:", a3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore29TodayCardParagraphOverlayView_label));
}

@end
