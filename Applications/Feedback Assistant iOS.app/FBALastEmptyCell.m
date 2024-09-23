@implementation FBALastEmptyCell

- (NSString)itemIdentifier
{
  return (NSString *)sub_10006394C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC18Feedback_Assistant16FBALastEmptyCell_itemIdentifier);
}

- (void)setItemIdentifier:(id)a3
{
  sub_1000639A0((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC18Feedback_Assistant16FBALastEmptyCell_itemIdentifier);
}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FBALastEmptyCell();
  v2 = v3.receiver;
  -[FBALastEmptyCell prepareForReuse](&v3, "prepareForReuse");
  objc_msgSend(v2, "setSelectionStyle:", 0, v3.receiver, v3.super_class);

}

- (_TtC18Feedback_Assistant16FBALastEmptyCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  NSString v9;
  _QWORD *v10;
  _TtC18Feedback_Assistant16FBALastEmptyCell *v11;
  objc_super v13;

  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v7 = v6;
    v8 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC18Feedback_Assistant16FBALastEmptyCell_itemIdentifier);
    *v8 = 0;
    v8[1] = 0xE000000000000000;
    v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v7);
  }
  else
  {
    v9 = 0;
    v10 = (Class *)((char *)&self->super.super.super.super.isa
                  + OBJC_IVAR____TtC18Feedback_Assistant16FBALastEmptyCell_itemIdentifier);
    *v10 = 0;
    v10[1] = 0xE000000000000000;
  }
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for FBALastEmptyCell();
  v11 = -[FBALastEmptyCell initWithStyle:reuseIdentifier:](&v13, "initWithStyle:reuseIdentifier:", a3, v9);

  return v11;
}

- (_TtC18Feedback_Assistant16FBALastEmptyCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  objc_super v6;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18Feedback_Assistant16FBALastEmptyCell_itemIdentifier);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBALastEmptyCell();
  return -[FBALastEmptyCell initWithCoder:](&v6, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->itemIdentifier[OBJC_IVAR____TtC18Feedback_Assistant16FBALastEmptyCell_itemIdentifier]);
}

@end
