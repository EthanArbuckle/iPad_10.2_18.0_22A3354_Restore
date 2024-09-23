@implementation FBKDateTimeCell

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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_itemIdentifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (UILabel)questionLabel
{
  return (UILabel *)(id)MEMORY[0x22079912C]((char *)self+ OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_questionLabel, a2);
}

- (void)setQuestionLabel:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UIDatePicker)datePicker
{
  return (UIDatePicker *)(id)MEMORY[0x22079912C]((char *)self+ OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_datePicker, a2);
}

- (void)setDatePicker:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (FBKBugFormEditorDelegate)editorDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_editorDelegate;
  swift_beginAccess();
  return (FBKBugFormEditorDelegate *)(id)MEMORY[0x22079912C](v2);
}

- (void)setEditorDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (void)awakeFromNib
{
  _TtC12FeedbackCore15FBKDateTimeCell *v2;

  v2 = self;
  sub_21DA597C0();

}

+ (id)reuseIdentifier
{
  return (id)sub_21DAC4810();
}

- (FBKQuestion)question
{
  return (FBKQuestion *)sub_21DA59C74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_question);
}

- (void)setQuestion:(id)a3
{
  sub_21DA59D18((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_question, sub_21DA59AAC);
}

- (FBKAnswer)answer
{
  return (FBKAnswer *)sub_21DA59C74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_answer);
}

- (void)setAnswer:(id)a3
{
  sub_21DA59D18((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_answer, sub_21DA59E98);
}

- (void)dateDidChange:(id)a3
{
  id v4;
  _TtC12FeedbackCore15FBKDateTimeCell *v5;

  v4 = a3;
  v5 = self;
  sub_21DA5A4E8(v4);

}

- (_TtC12FeedbackCore15FBKDateTimeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC12FeedbackCore15FBKDateTimeCell *)FBKDateTimeCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC12FeedbackCore15FBKDateTimeCell)initWithCoder:(id)a3
{
  return (_TtC12FeedbackCore15FBKDateTimeCell *)FBKDateTimeCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_21DA5AE8C((uint64_t)self + OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_editorDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_question));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore15FBKDateTimeCell_answer));
}

@end
