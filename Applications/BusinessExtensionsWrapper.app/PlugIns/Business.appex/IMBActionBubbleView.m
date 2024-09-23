@implementation IMBActionBubbleView

- (_TtC8Business19IMBActionBubbleView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC8Business19IMBActionBubbleView *result;

  v5 = OBJC_IVAR____TtC8Business19IMBActionBubbleView_tapIndicator;
  v6 = objc_allocWithZone((Class)type metadata accessor for IMBAuthenticationTapIndicator());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);

  result = (_TtC8Business19IMBActionBubbleView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001000B3DA0, "Business/IMBActionBubbleView.swift", 34, 2);
  __break(1u);
  return result;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  _TtC8Business19IMBActionBubbleView *v11;
  Class isa;
  id v13;
  objc_super v14;

  v7 = sub_1000090C8(0, &qword_1000EF7F0, UITouch_ptr);
  v8 = sub_100081938();
  v9 = static Set._unconditionallyBridgeFromObjectiveC(_:)(a3, v7, v8);
  v10 = a4;
  v11 = self;
  isa = Set._bridgeToObjectiveC()().super.isa;
  v14.receiver = v11;
  v14.super_class = (Class)type metadata accessor for IMBActionBubbleView();
  -[IMBBubbleView touchesBegan:withEvent:](&v14, "touchesBegan:withEvent:", isa, v10);

  v13 = objc_msgSend(*(id *)((char *)&v11->super.super.super.super.isa+ OBJC_IVAR____TtC8Business19IMBActionBubbleView_tapIndicator), "layer");
  if (qword_1000EBBA8 != -1)
    swift_once(&qword_1000EBBA8, sub_100017BC0);
  objc_msgSend(v13, "setBackgroundColor:", qword_1000F88E8);

  swift_bridgeObjectRelease(v9);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business19IMBActionBubbleView_message));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business19IMBActionBubbleView_tapIndicator));
}

@end
