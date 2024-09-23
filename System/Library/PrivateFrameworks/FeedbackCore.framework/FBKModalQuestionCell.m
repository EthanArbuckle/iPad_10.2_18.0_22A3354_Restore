@implementation FBKModalQuestionCell

- (FBKQuestion)question
{
  id *v2;

  v2 = (id *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_question);
  swift_beginAccess();
  return (FBKQuestion *)*v2;
}

- (void)setQuestion:(id)a3
{
  _TtC12FeedbackCore20FBKModalQuestionCell *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_21DABAEA8(a3);

}

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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_itemIdentifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

+ (NSString)reuseIdentifier
{
  void *v2;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_21DAC4810();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

+ (void)setReuseIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = sub_21DAC481C();
  v5 = v4;
  swift_beginAccess();
  qword_25539ADA0 = v3;
  qword_25539ADA8 = v5;
  swift_bridgeObjectRelease();
}

- (_TtC12FeedbackCore20FBKModalQuestionCell)initWithCoder:(id)a3
{
  _QWORD *v4;
  objc_super v6;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_question) = 0;
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_itemIdentifier);
  *v4 = 0;
  v4[1] = 0xE000000000000000;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for FBKModalQuestionCell();
  return -[FBKModalQuestionCell initWithCoder:](&v6, sel_initWithCoder_, a3);
}

- (_TtC12FeedbackCore20FBKModalQuestionCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;

  if (a4)
  {
    a4 = (id)sub_21DAC481C();
    v6 = v5;
  }
  else
  {
    v6 = 0;
  }
  return (_TtC12FeedbackCore20FBKModalQuestionCell *)sub_21DABAC60(a3, (uint64_t)a4, v6);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore20FBKModalQuestionCell_question));
  swift_bridgeObjectRelease();
}

@end
