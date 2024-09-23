@implementation FBKSliderCell

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
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_itemIdentifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (UILabel)questionLabel
{
  return (UILabel *)(id)MEMORY[0x22079912C]((char *)self+ OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_questionLabel, a2);
}

- (void)setQuestionLabel:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UILabel)answerLabel
{
  return (UILabel *)(id)MEMORY[0x22079912C]((char *)self+ OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_answerLabel, a2);
}

- (void)setAnswerLabel:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (UISlider)slider
{
  return (UISlider *)(id)MEMORY[0x22079912C]((char *)self+ OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_slider, a2);
}

- (void)setSlider:(id)a3
{
  swift_unknownObjectWeakAssign();
}

- (FBKBugFormEditorDelegate)editorDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_editorDelegate;
  swift_beginAccess();
  return (FBKBugFormEditorDelegate *)(id)MEMORY[0x22079912C](v2);
}

- (void)setEditorDelegate:(id)a3
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
  return (FBKQuestion *)sub_21DA59C74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_question);
}

- (void)setQuestion:(id)a3
{
  sub_21DAB2760((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_question);
}

- (FBKAnswer)answer
{
  return (FBKAnswer *)sub_21DA59C74((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_answer);
}

- (void)setAnswer:(id)a3
{
  sub_21DAB2760((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_answer);
}

- (void)updateSliderAndLabel
{
  _TtC12FeedbackCore13FBKSliderCell *v2;

  v2 = self;
  sub_21DAB292C();

}

- (void)awakeFromNib
{
  _TtC12FeedbackCore13FBKSliderCell *v2;

  v2 = self;
  sub_21DAB2FA4();

}

- (void)sliderTouchUpInside:(id)a3
{
  id v4;
  _TtC12FeedbackCore13FBKSliderCell *v5;

  v4 = a3;
  v5 = self;
  sub_21DAB3088(v4);

}

- (void)sliderValueChanged:(id)a3
{
  id v4;
  _TtC12FeedbackCore13FBKSliderCell *v5;

  v4 = a3;
  v5 = self;
  sub_21DAB337C(v4);

}

- (_TtC12FeedbackCore13FBKSliderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC12FeedbackCore13FBKSliderCell *)FBKSliderCell.init(style:reuseIdentifier:)(a3, (uint64_t)a4, v6);
}

- (_TtC12FeedbackCore13FBKSliderCell)initWithCoder:(id)a3
{
  return (_TtC12FeedbackCore13FBKSliderCell *)FBKSliderCell.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_21DA5AE8C((uint64_t)self + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_editorDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC12FeedbackCore13FBKSliderCell_question));

}

@end
