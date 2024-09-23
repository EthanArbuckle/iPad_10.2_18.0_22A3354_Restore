@implementation StarRatingControl

- (_TtC22SubscribePageExtension17StarRatingControl)initWithCoder:(id)a3
{
  _OWORD *v4;
  id v5;
  _TtC22SubscribePageExtension17StarRatingControl *result;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_rating) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_lastSentRating) = 0;
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_touchOutsideMargin);
  *v4 = xmmword_100670750;
  v4[1] = xmmword_100670750;
  v5 = a3;

  result = (_TtC22SubscribePageExtension17StarRatingControl *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/StarRatingControl.swift", 46, 2, 66, 0);
  __break(1u);
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  _TtC22SubscribePageExtension17StarRatingControl *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v3 = self;
  v4 = -[StarRatingControl traitCollection](v3, "traitCollection");
  v5 = sub_100104408();
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _TtC22SubscribePageExtension17StarRatingControl *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  sub_100102D6C(x, y, width, height);

}

- (uint64_t)beginTrackingWithTouch:(void *)a3 withEvent:(void *)a4
{
  id v6;
  id v7;
  char *v8;
  double v9;
  uint64_t v10;
  uint64_t v11;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  objc_msgSend(v6, "locationInView:", v8);
  sub_100103744(v9);
  v10 = *(_QWORD *)&v8[OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_rating];
  *(_QWORD *)&v8[OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_rating] = v11;
  if (v10 != v11)
    objc_msgSend(v8, "setNeedsDisplay");

  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v7;
  id v8;
  _TtC22SubscribePageExtension17StarRatingControl *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_10010462C(a3);

}

- (void)cancelTrackingWithEvent:(id)a3
{
  objc_class *v3;
  objc_class *v4;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_lastSentRating);
  v4 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_rating);
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_rating) = v3;
  if (v4 != v3)
    -[StarRatingControl setNeedsDisplay](self, "setNeedsDisplay", a3);
}

- (void)tintColorDidChange
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StarRatingControl();
  v2 = v3.receiver;
  -[StarRatingControl tintColorDidChange](&v3, "tintColorDidChange");
  objc_msgSend(v2, "setNeedsDisplay", v3.receiver, v3.super_class);

}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  _TtC22SubscribePageExtension17StarRatingControl *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v17;
  CGPoint v19;
  CGRect v20;

  y = a3.y;
  x = a3.x;
  v7 = *(double *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_touchOutsideMargin);
  v8 = *(double *)&self->rating[OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_touchOutsideMargin];
  v9 = *(double *)&self->lastSentRating[OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_touchOutsideMargin];
  v10 = *(double *)&self->touchOutsideMargin[OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_touchOutsideMargin];
  v11 = a4;
  v12 = self;
  -[StarRatingControl bounds](v12, "bounds");
  v20.origin.x = v13 - v8;
  v20.origin.y = v14 - v7;
  v20.size.width = v8 + v10 + v15;
  v20.size.height = v7 + v9 + v16;
  v19.x = x;
  v19.y = y;
  v17 = CGRectContainsPoint(v20, v19);

  return v17;
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
  v4.super_class = (Class)type metadata accessor for StarRatingControl();
  -[StarRatingControl setIsAccessibilityElement:](&v4, "setIsAccessibilityElement:", v3);
}

- (NSString)accessibilityLabel
{
  return (NSString *)sub_1001039B0(self, (uint64_t)a2, 0xD00000000000001FLL, (void *)0x8000000100636010);
}

- (void)setAccessibilityLabel:(id)a3
{
  sub_100103AC0(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityLabel_);
}

- (NSString)accessibilityHint
{
  return (NSString *)sub_1001039B0(self, (uint64_t)a2, 0xD00000000000001ELL, (void *)0x8000000100635FF0);
}

- (void)setAccessibilityHint:(id)a3
{
  sub_100103AC0(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityLabel_);
}

- (NSString)accessibilityValue
{
  Swift::Int v2;
  NSString *v3;
  Swift::String v4;
  Swift::String v5;
  void *object;
  NSString v7;

  v2 = *(Swift::Int *)((char *)self + OBJC_IVAR____TtC22SubscribePageExtension17StarRatingControl_rating);
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    v3 = self;
    v4._object = (void *)0x8000000100635FD0;
    v4._countAndFlagsBits = 0xD00000000000001ALL;
    v5._countAndFlagsBits = 0;
    v5._object = (void *)0xE000000000000000;
    object = localizedStringWithCount(_:count:comment:)(v4, v2, v5)._object;

    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(object);
    return (NSString *)v7;
  }
  return self;
}

- (void)setAccessibilityValue:(id)a3
{
  sub_100103AC0(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_setAccessibilityValue_);
}

- (NSArray)accessibilityCustomActions
{
  _TtC22SubscribePageExtension17StarRatingControl *v2;
  unint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_100103BB8();

  if (v3)
  {
    sub_100019574(0, (unint64_t *)&unk_1007FB820, UIAccessibilityCustomAction_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (void)setAccessibilityCustomActions:(id)a3
{
  void *isa;
  uint64_t v5;
  uint64_t v6;
  _TtC22SubscribePageExtension17StarRatingControl *v7;
  _TtC22SubscribePageExtension17StarRatingControl *v8;
  objc_super v9;

  isa = a3;
  if (a3)
  {
    v5 = sub_100019574(0, (unint64_t *)&unk_1007FB820, UIAccessibilityCustomAction_ptr);
    v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(isa, v5);
    v7 = self;
    isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v6);
  }
  else
  {
    v8 = self;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for StarRatingControl();
  -[StarRatingControl setAccessibilityCustomActions:](&v9, "setAccessibilityCustomActions:", isa);

}

- (void)accessibilitySetStarRatingZero
{
  _TtC22SubscribePageExtension17StarRatingControl *v2;

  v2 = self;
  sub_100103E94(0);

}

- (void)accessibilitySetStarRatingOne
{
  _TtC22SubscribePageExtension17StarRatingControl *v2;

  v2 = self;
  sub_100103E94(1);

}

- (void)accessibilitySetStarRatingTwo
{
  _TtC22SubscribePageExtension17StarRatingControl *v2;

  v2 = self;
  sub_100103E94(2);

}

- (void)accessibilitySetStarRatingThree
{
  _TtC22SubscribePageExtension17StarRatingControl *v2;

  v2 = self;
  sub_100103E94(3);

}

- (void)accessibilitySetStarRatingFour
{
  _TtC22SubscribePageExtension17StarRatingControl *v2;

  v2 = self;
  sub_100103E94(4);

}

- (void)accessibilitySetStarRatingFive
{
  _TtC22SubscribePageExtension17StarRatingControl *v2;

  v2 = self;
  sub_100103E94(5);

}

- (_TtC22SubscribePageExtension17StarRatingControl)initWithFrame:(CGRect)a3
{
  _TtC22SubscribePageExtension17StarRatingControl *result;

  result = (_TtC22SubscribePageExtension17StarRatingControl *)_swift_stdlib_reportUnimplementedInitializer("SubscribePageExtension.StarRatingControl", 40, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

@end
