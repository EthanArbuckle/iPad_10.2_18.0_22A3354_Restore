@implementation FBKUserCell

- (NSString)itemIdentifier
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21DAC4810();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (void)setItemIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = sub_21DAC481C();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore11FBKUserCell_itemIdentifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (void)updateWithUser:(id)a3
{
  id v4;
  _TtC12FeedbackCore11FBKUserCell *v5;

  v4 = a3;
  v5 = self;
  sub_21DA6F818(v4);

}

- (_TtC12FeedbackCore11FBKUserCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  _TtC12FeedbackCore11FBKUserCell *v9;
  objc_super v11;

  if (a4)
  {
    sub_21DAC481C();
    v6 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC12FeedbackCore11FBKUserCell_itemIdentifier);
    *v6 = 0;
    v6[1] = 0xE000000000000000;
    v7 = (void *)sub_21DAC4810();
    swift_bridgeObjectRelease();
  }
  else
  {
    v7 = 0;
    v8 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC12FeedbackCore11FBKUserCell_itemIdentifier);
    *v8 = 0;
    v8[1] = 0xE000000000000000;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for FBKUserCell();
  v9 = -[FBKUserCell initWithStyle:reuseIdentifier:](&v11, sel_initWithStyle_reuseIdentifier_, a3, v7);

  return v9;
}

- (_TtC12FeedbackCore11FBKUserCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  objc_super v6;

  v4 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12FeedbackCore11FBKUserCell_itemIdentifier);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBKUserCell();
  return -[FBKUserCell initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
