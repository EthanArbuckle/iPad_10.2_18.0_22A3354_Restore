@implementation FBAAddAttachmentsCell

+ (BOOL)supportsMenu
{
  return 0;
}

- (NSString)itemIdentifier
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)&self->itemIdentifier[OBJC_IVAR____TtC18Feedback_Assistant21FBAAddAttachmentsCell_itemIdentifier];
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (void)setItemIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC18Feedback_Assistant21FBAAddAttachmentsCell_itemIdentifier);
  v6 = *(_QWORD *)&self->itemIdentifier[OBJC_IVAR____TtC18Feedback_Assistant21FBAAddAttachmentsCell_itemIdentifier];
  *v5 = v4;
  v5[1] = v7;
  swift_bridgeObjectRelease(v6);
}

- (UIMenu)menu
{
  UIMenu *result;

  result = *(UIMenu **)((char *)&self->super.super.super.super.isa
                      + OBJC_IVAR____TtC18Feedback_Assistant21FBAAddAttachmentsCell_button);
  if (result)
    return (UIMenu *)-[UIMenu menu](result, "menu");
  __break(1u);
  return result;
}

- (void)setMenu:(id)a3
{
  void *v3;

  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC18Feedback_Assistant21FBAAddAttachmentsCell_button);
  if (v3)
    objc_msgSend(v3, "setMenu:", a3);
  else
    __break(1u);
}

- (_TtC18Feedback_Assistant21FBAAddAttachmentsCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  objc_super v6;

  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC18Feedback_Assistant21FBAAddAttachmentsCell_itemIdentifier);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC18Feedback_Assistant21FBAAddAttachmentsCell_button) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBAAddAttachmentsCell();
  return -[FBAAddAttachmentsCell initWithCoder:](&v6, "initWithCoder:", a3);
}

- (_TtC18Feedback_Assistant21FBAAddAttachmentsCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC18Feedback_Assistant21FBAAddAttachmentsCell *)sub_100062DF0(a3, (uint64_t)a4, v6);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->itemIdentifier[OBJC_IVAR____TtC18Feedback_Assistant21FBAAddAttachmentsCell_itemIdentifier]);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC18Feedback_Assistant21FBAAddAttachmentsCell_button));
}

@end
