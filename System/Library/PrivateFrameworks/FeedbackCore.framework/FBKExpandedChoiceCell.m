@implementation FBKExpandedChoiceCell

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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore21FBKExpandedChoiceCell_itemIdentifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (FBKBugFormEditorDelegate)delegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC12FeedbackCore21FBKExpandedChoiceCell_delegate;
  swift_beginAccess();
  return (FBKBugFormEditorDelegate *)(id)MEMORY[0x22079912C](v2);
}

- (void)setDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

+ (id)reuseIdentifier
{
  return (id)sub_21DAC4810();
}

- (FBKQuestion)question
{
  return (FBKQuestion *)sub_21DA59C74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore21FBKExpandedChoiceCell_question);
}

- (void)setQuestion:(id)a3
{
  _TtC12FeedbackCore21FBKExpandedChoiceCell *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_21DA9CE50(a3);

}

- (FBKAnswer)answer
{
  return (FBKAnswer *)sub_21DA59C74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore21FBKExpandedChoiceCell_answer);
}

- (void)setAnswer:(id)a3
{
  _TtC12FeedbackCore21FBKExpandedChoiceCell *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_21DA9D000(a3);

}

- (BOOL)showError
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC12FeedbackCore21FBKExpandedChoiceCell_showError;
  swift_beginAccess();
  return *v2;
}

- (void)setShowError:(BOOL)a3
{
  _TtC12FeedbackCore21FBKExpandedChoiceCell *v4;

  v4 = self;
  sub_21DA99850(a3);

}

- (void)prepareForReuse
{
  _TtC12FeedbackCore21FBKExpandedChoiceCell *v2;

  v2 = self;
  sub_21DA99AE4();

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC12FeedbackCore21FBKExpandedChoiceCell *v9;
  uint64_t v10;

  v4 = sub_21DAC4054();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21DAC4048();
  v9 = self;
  sub_21DA99C80();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (void)updateCellContent
{
  _TtC12FeedbackCore21FBKExpandedChoiceCell *v2;

  v2 = self;
  sub_21DA99EF8();

}

- (_TtC12FeedbackCore21FBKExpandedChoiceCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC12FeedbackCore21FBKExpandedChoiceCell *)FBKExpandedChoiceCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC12FeedbackCore21FBKExpandedChoiceCell)initWithCoder:(id)a3
{
  return (_TtC12FeedbackCore21FBKExpandedChoiceCell *)FBKExpandedChoiceCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_21DA5AE8C((uint64_t)self + OBJC_IVAR____TtC12FeedbackCore21FBKExpandedChoiceCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore21FBKExpandedChoiceCell_question));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore21FBKExpandedChoiceCell_answer));
  swift_release();
}

@end
